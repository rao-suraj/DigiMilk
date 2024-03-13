import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class GenerateBillState extends Equatable {
  const GenerateBillState();

  @override
  List<Object?> get props => [];
}

class GenerateBillInitial extends GenerateBillState {
  const GenerateBillInitial();

  @override
  List<Object?> get props => [];
}

class GenerateBillLoading extends GenerateBillState {
  const GenerateBillLoading();

  @override
  List<Object?> get props => [];
}

class GenerateBillLoaded extends GenerateBillState {
  final DatabaseEvent databaseEvent;
  const GenerateBillLoaded(this.databaseEvent);

  @override
  List<Object?> get props => [databaseEvent];
}

class GenerateBillError extends GenerateBillState {
  const GenerateBillError();

  @override
  List<Object?> get props => [];
}
