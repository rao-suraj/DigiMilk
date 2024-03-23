import 'package:dhood_app/domain/models/farmer_info.dart';
import 'package:equatable/equatable.dart';

class FarmerDetailsState extends Equatable {
  const FarmerDetailsState();

  @override
  List<Object?> get props => [];
}

class FarmerDetailsLoading extends FarmerDetailsState {
  const FarmerDetailsLoading();
}

class FarmerDetailsInitial extends FarmerDetailsState {
  const FarmerDetailsInitial();
}

class FarmerDetailsSuccrss extends FarmerDetailsState {
  final List<FarmerInfo> farmerInfo;
  const FarmerDetailsSuccrss({required this.farmerInfo});
}

class FarmerDetailsError extends FarmerDetailsState {
  final String message;
  const FarmerDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}
