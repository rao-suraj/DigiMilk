import 'package:dhood_app/data/utils/app_error.dart';
import 'package:dhood_app/data/utils/error_type.dart';
import 'package:dhood_app/domain/models/dairy_info.dart';
import 'package:dhood_app/domain/models/farmer_info.dart';
import 'package:dhood_app/domain/models/milk_info.dart';
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
      {required MilkInfo params}) async {
    final dbFarmerRef = _fbDatabase.ref('farmer');
    final dbDairyRef = _fbDatabase.ref('dairy_workers');
    try {
      await dbFarmerRef
          .child(params.farmerId)
          .child('farmer_log')
          .child(DateFormat('yyyy-MM-dd').format(DateTime.now()))
          .child(Time.toStringCustom(params.time))
          .update(params.toJson());
      await dbDairyRef
          .child(params.dairyId)
          .child('dairy_log')
          .child(DateFormat('yyyy-MM-dd').format(DateTime.now()))
          .child(Time.toStringCustom(params.time))
          .update(params.toJson());
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
      {required String name,
      required String id,
      required String password}) async {
    final dbFarmerRef = _fbDatabase.ref('farmer');
    try {
      dbFarmerRef.child(id).set({'id': id, 'name': name, 'password': password});
      return const Right(null);
    } catch (e) {
      return Left(AppError(
          errorType: ErrorType.unknown, message: "error while adding data"));
    }
  }

  // no other method comming into mind right now
  Future<Either<AppError, List<FarmerInfo>>> getFarmerList() async {
    final dbFarmerRef = _fbDatabase.ref('farmer');
    final res = await dbFarmerRef.get();
    List<FarmerInfo> list = [];
    try {
      // iterate through all the farmers
      for (var child in res.children) {
        await dbFarmerRef.child(child.key.toString()).once().then((value) {
          // store the farmer info into object and addd it to list
          final info = value.snapshot.value as Map<dynamic, dynamic>;
          final farmerInfo = FarmerInfo()
            ..id = info['id']
            ..name = info['name'];
          list.add(farmerInfo);
        });
      }

      return Right(list);
    } catch (e) {
      return Left(
          AppError(errorType: ErrorType.unknown, message: e.toString()));
    }
  }

  Future<Either<AppError, List<MilkInfo>>> getMilkData(
      {required String id}) async {
    final ref = _fbDatabase.ref('farmer').child(id).child('farmer_log');

    try {
      List<MilkInfo> list = [];
      await ref.get().then((value) {
        // iterate through each entry in farmer_log
        for (var item in value.children) {
          final timeVal = item.value as Map<dynamic, dynamic>;
          // if morning value is present get that value
          if (timeVal["morning"] != null) {
            final res = timeVal["morning"] as Map<dynamic, dynamic>;
            final milkInfo = MilkInfo(
                dairyId: res['dairyId'],
                farmerId: res['farmerId'],
                ph: res['ph'],
                temperature: res['temperature'],
                fat: res['fat'],
                colors: res['colors'],
                quality: res['quality'],
                time: Time.fromString(res['time']),
                date: res['date'],
                totAmount: res['totAmount'],
                quantity: res['quantity']);
            list.add(milkInfo);
          }
          // if evening value is present get that value
           if (timeVal["evening"] != null) {
            final res = timeVal["evening"] as Map<dynamic, dynamic>;
            final milkInfo = MilkInfo(
                dairyId: res['dairyId'],
                farmerId: res['farmerId'],
                ph: res['ph'],
                temperature: res['temperature'],
                fat: res['fat'],
                colors: res['colors'],
                quality: res['quality'],
                time: Time.fromString(res['time']),
                date: res['date'],
                totAmount: res['totAmount'],
                quantity: res['quantity']);
            list.add(milkInfo);
          }
        }
      });
      return Right(list);
    } catch (e) {
      return Left(
          AppError(errorType: ErrorType.unknown, message: e.toString()));
    }
  }

  Future<Either<AppError, List<MilkInfo>>> getDairyData(
      {required String id}) async {
    final ref = _fbDatabase.ref('dairy_workers').child(id).child('dairy_log');

    try {
      List<MilkInfo> list = [];
      await ref.get().then((value) {
        for (var item in value.children) {
          final timeVal = item.value as Map<dynamic, dynamic>;

          // if morning is present get its value
          if (timeVal["morning"] != null) {
            final res = timeVal["morning"] as Map<dynamic, dynamic>;
            list.add(MilkInfo(
              dairyId: res['dairyId'],
              farmerId: res['farmerId'],
              ph: res['ph'],
              temperature: res['temperature'],
              fat: res['fat'],
              colors: res['colors'],
              quality: res['quality'],
              time: Time.fromString(res['time']),
              date: res['date'],
              totAmount: res['totAmount'],
              quantity: res['quantity'],
            ));
          }

          // if evening value if prisent get its value
          if (timeVal["evening"] != null) {
            final res = timeVal["evening"] as Map<dynamic, dynamic>;
            list.add(MilkInfo(
              dairyId: res['dairyId'],
              farmerId: res['farmerId'],
              ph: res['ph'],
              temperature: res['temperature'],
              fat: res['fat'],
              colors: res['colors'],
              quality: res['quality'],
              time: Time.fromString(res['time']),
              date: res['date'],
              totAmount: res['totAmount'],
              quantity: res['quantity'],
            ));
          }
        }
      });
      return Right(list);
    } catch (e) {
      return Left(
          AppError(errorType: ErrorType.unknown, message: e.toString()));
    }
  }
}
