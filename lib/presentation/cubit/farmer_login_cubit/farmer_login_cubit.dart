import 'package:dhood_app/domain/repository/farmer_repository.dart';
import 'package:dhood_app/presentation/cubit/farmer_login_cubit/farmer_login_state.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class FarmerLoginCubit extends Cubit<FarmerLoginState> {
  final IFarmerRepository _farmerRepository;
  FarmerLoginCubit(this._farmerRepository) : super(const FarmerLoginInitial());

  void farmerlogin({required String id, required String password}) {
    emit(const FarmerLoginLoading());
    final response =
        _farmerRepository.farmerLogin(id: id, password: password);

    response.fold((left) => emit(FarmerLoginError(left.message!)),
        (right) => emit(const FarmerLoginSuccrss()));
  }
}
