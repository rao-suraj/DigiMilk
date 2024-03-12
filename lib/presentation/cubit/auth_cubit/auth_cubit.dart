import 'package:dhood_app/data/utils/app_error.dart';
import 'package:dhood_app/data/utils/error_type.dart';
import 'package:dhood_app/domain/models/dairy_info.dart';
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
    final farmerInfo = await _localRepository.getFarmeInfo();
    final dairyInfo = await _localRepository.getDairyInfo();
    if (farmerInfo != null) {
      if (farmerInfo.isLogedIn != null && farmerInfo.isLogedIn == true) {
        emit(FarmerAuthenticated(farmerInfo: farmerInfo));
        return;
      }
    }

    if (dairyInfo != null) {
      if (dairyInfo.isLogedIn != null && dairyInfo.isLogedIn == true) {
        emit(DairyAuthenticated(dairyInfo: dairyInfo));
        return;
      }
    }
    emit(const Unauthenticated());
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

  Future<void> logOutDairyWorker() async {
    await _localRepository.logOutDairy();
  }

  Future<void> loginDairyWorker({required DairyInfo dairyInfo}) async {
    await _localRepository.loginDairy(dairyInfo: dairyInfo);
  }
}
