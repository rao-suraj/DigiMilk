import 'package:dhood_app/domain/models/milk_info.dart';
import 'package:equatable/equatable.dart';

class DairyDetailsState extends Equatable {
  const DairyDetailsState();

  @override
  List<Object?> get props => [];
}

class DairyDetailsLoading extends DairyDetailsState {
  const DairyDetailsLoading();
}

class DairyDetailsInitial extends DairyDetailsState {
  const DairyDetailsInitial();
}

class DairyDetailsSuccrss extends DairyDetailsState {
  final List<MilkInfo> dairyDetails;
  const DairyDetailsSuccrss({required this.dairyDetails});
}

class DairyDetailsError extends DairyDetailsState {
  final String message;
  const DairyDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}
