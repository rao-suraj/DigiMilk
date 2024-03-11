import 'package:dhood_app/domain/repository/dairy_worker_repository.dart';
import 'package:dhood_app/presentation/cubit/dairy_login_cubit/dairy_login_state.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class DairyLoginCubit extends Cubit<DairyLoginState> {
  final IDairyWorkerRepository _workerRepository;
  DairyLoginCubit(this._workerRepository) : super(const DairyLoginState());

  void dairyWorkerLogin({required String id, required String password}) {
    emit(const DairyLoginLoading());
    final response =
        _workerRepository.dairyWorkerLogin(id: id, password: password);

    response.fold((left) => emit(DairyLoginError(left.message!)),
        (right) => emit(const DairyLoginSuccrss()));
  }
}
