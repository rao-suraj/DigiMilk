import 'package:dhood_app/domain/repository/farmer_repository.dart';
import 'package:dhood_app/presentation/cubit/milk_log_cubit/milk_log_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MilkLogCubit extends Cubit<MilkLogState> {
  final IFarmerRepository _dairyRepository;

  MilkLogCubit(this._dairyRepository) : super(const MilkLogInitial());

  void getMilklog({required String id}) async {
    emit(const MilkLogLoading());
    final res = await _dairyRepository.getMilkData(id: id);
    res.fold((left) => emit(MilkLogError(left.message!)),
        (right) => emit(MilkLogSuccrss(milkLog: right)));
  }
}
