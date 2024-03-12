part of 'auth_cubit.dart';

abstract class AuthState {
  final FarmerInfo? farmerInfo;

  const AuthState({
    this.farmerInfo,
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

class AuthError extends AuthState {
  final AppError error;

  const AuthError(this.error);
}
