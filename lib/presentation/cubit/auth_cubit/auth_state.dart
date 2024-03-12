part of 'auth_cubit.dart';

abstract class AuthState {
  final FarmerInfo? farmerInfo;
  final DairyInfo? dairyInfo;

  const AuthState({
    this.farmerInfo,
    this.dairyInfo,
  });
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class Unauthenticated extends AuthState {
  const Unauthenticated();
}

class FarmerAuthenticated extends AuthState {
  const FarmerAuthenticated({
    super.farmerInfo,
  });
}

class DairyAuthenticated extends AuthState {
  const DairyAuthenticated({
    super.dairyInfo,
  });
}

class AuthError extends AuthState {
  final AppError error;

  const AuthError(this.error);
}
