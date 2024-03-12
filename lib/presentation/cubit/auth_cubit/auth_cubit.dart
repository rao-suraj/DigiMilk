import 'package:dhood_app/data/utils/app_error.dart';
import 'package:dhood_app/data/utils/error_type.dart';
import 'package:dhood_app/domain/models/farmer_info.dart';
import 'package:dhood_app/domain/repository/local_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final ILocalRepository _localRepository;

  AuthCubit(this._localRepository) : super(const AuthLoading());

  Future<void> checkAuth() async {
    emit(const AuthLoading());
    final res = await _localRepository.getFarmeInfo();
    if (res != null) {
      if (res.isLogedIn != null && res.isLogedIn == true) {
        emit(FarmerAuthenticated(farmerInfo: res));
      } else {
        emit(const Unauthenticated());
      }
    } else {
      emit(const Unauthenticated());
    }
  }

  Future<void> getFarmeInfo() async {
    emit(const AuthLoading());
    final response = await _localRepository.getFarmeInfo();
    if (response != null && response.isLogedIn == true) {
      emit(FarmerAuthenticated(farmerInfo: response));
    } else {
      emit(
        AuthError(
          AppError(
              errorType: ErrorType.unknown,
              message: 'Cant get the farmer details'),
        ),
      );
    }
  }

  Future<void> logOutFarmer() async {
    await _localRepository.logOutFarmer();
  }

  Future<void> loginFarmer({required FarmerInfo farmerInfo}) async {
    await _localRepository.loginFarmer(farmerInfo: farmerInfo);
  }
}
