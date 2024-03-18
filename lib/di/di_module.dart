import 'package:dhood_app/data/utils/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  FirebaseDatabase get database => FirebaseDatabase.instance;

  @lazySingleton
  Dio dio() => Dio(
        BaseOptions(
          contentType: Headers.jsonContentType,
          baseUrl: ApiConstants.baseUrl,
          connectTimeout: const Duration(milliseconds: 60 * 1000),
          receiveTimeout: const Duration(milliseconds: 60 * 1000),
          sendTimeout: const Duration(milliseconds: 30 * 1000),
        ),
      );
}
