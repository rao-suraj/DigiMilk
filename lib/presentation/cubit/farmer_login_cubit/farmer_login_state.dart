import 'package:equatable/equatable.dart';

class FarmerLoginState extends Equatable {
  const FarmerLoginState();

  @override
  List<Object?> get props => [];
}

class FarmerLoginLoading extends FarmerLoginState {
  const FarmerLoginLoading();
}

class FarmerLoginInitial extends FarmerLoginState {
  const FarmerLoginInitial();
}

class FarmerLoginSuccrss extends FarmerLoginState {
  const FarmerLoginSuccrss();
}

class FarmerLoginError extends FarmerLoginState {
  final String message;
  const FarmerLoginError(this.message);

  @override
  List<Object?> get props => [message];
}
