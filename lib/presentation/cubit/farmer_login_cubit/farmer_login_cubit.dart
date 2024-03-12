import 'package:dhood_app/domain/repository/farmer_repository.dart';
import 'package:dhood_app/domain/repository/local_repository.dart';
import 'package:dhood_app/presentation/cubit/farmer_login_cubit/farmer_login_state.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class FarmerLoginCubit extends Cubit<FarmerLoginState> {
  final IFarmerRepository _farmerRepository;
  final ILocalRepository _localRepository;
  FarmerLoginCubit(this._farmerRepository, this._localRepository)
      : super(const FarmerLoginInitial());

  void farmerlogin({required String id, required String password}) {
    print("LLLLLLLL");
    emit(const FarmerLoginLoading());
    final response = _farmerRepository.farmerLogin(id: id, password: password);

    response.fold((left) => emit(FarmerLoginError(left.message!)), (right) {
      print(right.isLogedIn);
      _localRepository.loginFarmer(farmerInfo: right);
      emit(FarmerLoginSuccrss(farmerInfo: right));
    });
  }
}
