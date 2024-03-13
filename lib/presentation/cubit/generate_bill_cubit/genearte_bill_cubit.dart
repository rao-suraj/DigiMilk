import 'package:dhood_app/domain/repository/remote_database_repository.dart';
import 'package:dhood_app/presentation/cubit/generate_bill_cubit/generate_bill_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GenerateBillCubit extends Cubit<GenerateBillState> {
  final IRemoteDatabaseRepository _databaseRepository;

  GenerateBillCubit(this._databaseRepository)
      : super(const GenerateBillInitial());

  Future<void> getDataSensorStream() async {
    final response = _databaseRepository.getSensorDataStream();

    response.listen((event) {
      emit(GenerateBillLoaded(event));
    });
  }
}
