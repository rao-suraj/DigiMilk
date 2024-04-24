import 'package:dhood_app/domain/models/get_quality_params.dart';
import 'package:dhood_app/domain/models/milk_info.dart';
import 'package:dhood_app/domain/repository/remote_database_repository.dart';
import 'package:dhood_app/presentation/cubit/generate_bill_cubit/generate_bill_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@injectable
class GenerateBillCubit extends Cubit<GenerateBillState> {
  final IRemoteDatabaseRepository _databaseRepository;

  GenerateBillCubit(this._databaseRepository)
      : super(const GenerateBillInitial());

  Future<void> getDataSensorStream() async {
    emit(const GenerateBillLoading());
    final response = _databaseRepository.getSensorDataStream();

    response.listen((event) {
      emit(GenerateBillLoaded(event));
    });
  }

  Future<void> generateBill(
      {required double ph,
      required int color,
      required int fat,
      required int temp,
      required String farmerId,
      required String dairyId,
      required int quantity}) async {
    print("Temp $temp");
    print("pH $ph");
    print("fat $fat");
    print("color $color");

    int totAmount;
    String quality;
    emit(const GenerateBillLoading());
    final response = await _databaseRepository.getQuality(
        params: GetQualityParams(
            ph: ph, temperature: temp, fat: fat, colour: color));

    emit(response.fold((left) => GenerateBillError(left.message!), (right) {
      print("Grade ${right.grade}");
      print(right.grade);
      switch (right.grade) {
        case 0:
          quality = "Average";
          totAmount = 32 * quantity;
          break;
        case 1:
          quality = "Good";
          totAmount = 34 * quantity;
          break;
        case 2:
          quality = "Great";
          totAmount = 36 * quantity;
        default:
          return const GenerateBillError("Invalid grade");
      }

      _databaseRepository.updateMildQuality(
          params: MilkInfo(
              dairyId: dairyId,
              farmerId: farmerId,
              ph: ph.toInt(),
              temperature: temp,
              fat: fat,
              colors: color,
              quality: right.grade,
              time: Time.getTime(),
              date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
              quantity: quantity,
              totAmount: totAmount));
      return GenerateBillSuccess(quality, totAmount);
    }));
  }
}
