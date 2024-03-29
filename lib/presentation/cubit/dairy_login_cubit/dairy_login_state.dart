import 'package:dhood_app/domain/models/dairy_info.dart';
import 'package:equatable/equatable.dart';

class DairyLoginState extends Equatable {
  const DairyLoginState();

  @override
  List<Object?> get props => [];
}

class DairyLoginLoading extends DairyLoginState {
  const DairyLoginLoading();
}

class DairyLoginInitial extends DairyLoginState {
  const DairyLoginInitial();
}

class DairyLoginSuccrss extends DairyLoginState {
  final DairyInfo dairyInfo;
  const DairyLoginSuccrss(this.dairyInfo);
}

class DairyLoginError extends DairyLoginState {
  final String message;
  const DairyLoginError(this.message);

  @override
  List<Object?> get props => [message];
}
