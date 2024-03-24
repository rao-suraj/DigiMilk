import 'package:dhood_app/domain/models/milk_info.dart';
import 'package:equatable/equatable.dart';

class MilkLogState extends Equatable {
  const MilkLogState();

  @override
  List<Object?> get props => [];
}

class MilkLogLoading extends MilkLogState {
  const MilkLogLoading();
}

class MilkLogInitial extends MilkLogState {
  const MilkLogInitial();
}

class MilkLogSuccrss extends MilkLogState {
  final List<MilkInfo> milkLog;
  const MilkLogSuccrss({required this.milkLog});
}

class MilkLogError extends MilkLogState {
  final String message;
  const MilkLogError(this.message);

  @override
  List<Object?> get props => [message];
}
