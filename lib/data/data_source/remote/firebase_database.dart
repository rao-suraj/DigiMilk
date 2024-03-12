import 'package:dhood_app/data/utils/app_error.dart';
import 'package:dhood_app/data/utils/error_type.dart';
import 'package:dhood_app/domain/models/farmer_info.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirebaseDatabaseService {
  final FirebaseDatabase _fbDatabase;

  FirebaseDatabaseService(this._fbDatabase);

  Stream<DatabaseEvent> getSensorDataStream() {
    final dbRef = _fbDatabase.ref('sensor');
    return dbRef.onValue;
  }

  Future<Either<AppError, Map<dynamic, dynamic>>> dairyWorkerLogin(
      {required String id, required String password}) async {
    final dbRef = _fbDatabase.ref('dairy_workers');
    try {
      final result = await dbRef.child(id).once();
      if (result.snapshot.exists) {
        final data = result.snapshot.value as Map<dynamic, dynamic>;
        final dairyPassword = data['password'] as String;
        if (password == dairyPassword) {
          return Right(data);
        } else {
          return Left(AppError(
              errorType: ErrorType.incorrectPassword,
              message: "Wrond Password"));
        }
      } else {
        return Left(
            AppError(errorType: ErrorType.idNotFound, message: 'Id not found'));
      }
    } catch (error) {
      // Handle any errors that occur during the process
      return Left(AppError(
        errorType: ErrorType.unknown,
        message: error.toString(),
      ));
    }
  }

  Future<Either<AppError, FarmerInfo>> farmerLogin(
      {required String id, required String password}) async {
    final dbRef = _fbDatabase.ref('farmer');
    try {
      final result = await dbRef.child(id).once();
      if (result.snapshot.exists) {
        final data = result.snapshot.value as Map<dynamic, dynamic>;
        final dairyPassword = data['password'] as String;
        if (password == dairyPassword) {
          return Right(FarmerInfo()
            ..id = data['id']
            ..isLogedIn = true
            ..name = data['name']);
        } else {
          return Left(AppError(
              errorType: ErrorType.incorrectPassword,
              message: "Wrond Password"));
        }
      } else {
        return Left(
            AppError(errorType: ErrorType.idNotFound, message: 'Id not found'));
      }
    } catch (error) {
      // Handle any errors that occur during the process
      return Left(AppError(
        errorType: ErrorType.unknown,
        message: error.toString(),
      ));
    }
  }
}
