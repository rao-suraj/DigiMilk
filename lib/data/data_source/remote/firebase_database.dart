import 'package:dhood_app/data/utils/app_error.dart';
import 'package:dhood_app/data/utils/error_type.dart';
import 'package:dhood_app/domain/models/dairy_info.dart';
import 'package:dhood_app/domain/models/farmer_info.dart';
import 'package:dhood_app/domain/models/upload_milk_quality_params.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@lazySingleton
class FirebaseDatabaseService {
  final FirebaseDatabase _fbDatabase;

  FirebaseDatabaseService(this._fbDatabase);

  Stream<DatabaseEvent> getSensorDataStream() {
    final dbRef = _fbDatabase.ref('sensor');
    return dbRef.onValue;
  }

  Future<Either<AppError, DairyInfo>> dairyWorkerLogin(
      {required String id, required String password}) async {
    final dbRef = _fbDatabase.ref('dairy_workers');
    try {
      final result = await dbRef.child(id).once();
      if (result.snapshot.exists) {
        final data = result.snapshot.value as Map<dynamic, dynamic>;
        final dairyPassword = data['password'] as String;
        if (password == dairyPassword) {
          return Right(DairyInfo()
            ..id = id
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
            ..id = id
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

  Future<Either<AppError, void>> updateMildQuality(
      {required UploadMilkQualityParams params}) async {
    final dbFarmerRef = _fbDatabase.ref('farmer');
    final dbDairyRef = _fbDatabase.ref('dairy_workers');
    try {
      await dbFarmerRef
          .child(params.farmerId)
          .child('farmer_log')
          .child(DateFormat('yyyy-MM-dd').format(DateTime.now()))
          .set(params.toJson());
      await dbDairyRef
          .child(params.dairyId)
          .child('dairy_log')
          .child(DateFormat('yyyy-MM-dd').format(DateTime.now()))
          .set(params.toJson());
      return const Right(null);
    } catch (error) {
      print(error);
      // Handle any errors that occur during the process
      return Left(AppError(
        errorType: ErrorType.unknown,
        message: error.toString(),
      ));
    }
  }

  Future<Either<AppError, void>> addFarmer(
      {required String name, required String id, required String password}) async {
    final dbFarmerRef = _fbDatabase.ref('farmer');
    try {
      dbFarmerRef.child(id).set({name: name, password: password});
      return const Right(null);
    } catch (e) {
      return Left(AppError(errorType: ErrorType.unknown, message: "error while adding data"));
    }
  }

}
