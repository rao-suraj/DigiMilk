import 'package:dhood_app/data/utils/error_type.dart';

class AppError {
  final ErrorType errorType;
  final String? message;
  final int? code;

  AppError({required this.errorType, this.message, this.code});
}
