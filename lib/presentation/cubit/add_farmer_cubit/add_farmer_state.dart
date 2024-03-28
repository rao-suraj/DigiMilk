import 'package:equatable/equatable.dart';

class AddFarmerStates extends Equatable {
  const AddFarmerStates();

  @override
  List<Object?> get props => [];
}

class AddFarmerLoading extends AddFarmerStates {
  const AddFarmerLoading();
}

class AddFarmerInitial extends AddFarmerStates {
  const AddFarmerInitial();
}

class AddFarmerSuccess extends AddFarmerStates {
  const AddFarmerSuccess();
}

class AddFarmerError extends AddFarmerStates {
  final String message;
  const AddFarmerError(this.message);

  @override
  List<Object?> get props => [message];
}
