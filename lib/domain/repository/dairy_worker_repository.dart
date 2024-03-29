import 'package:dhood_app/data/data_source/remote/firebase_database.dart';
import 'package:dhood_app/data/utils/app_error.dart';
import 'package:dhood_app/domain/models/dairy_info.dart';
import 'package:dhood_app/domain/models/milk_info.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

abstract class IDairyWorkerRepository {
  Future<Either<AppError, DairyInfo>> dairyWorkerLogin(
      {required String id, required String password});

  Future<Either<AppError, List<MilkInfo>>> getDairyData({required String id});
}

@LazySingleton(as: IDairyWorkerRepository)
class DairyWorkerRepository implements IDairyWorkerRepository {
  final FirebaseDatabaseService _databaseService;

  DairyWorkerRepository(this._databaseService);

  @override
  Future<Either<AppError, DairyInfo>> dairyWorkerLogin(
      {required String id, required String password}) async {
    return await _databaseService.dairyWorkerLogin(id: id, password: password);
  }
  
  @override
  Future<Either<AppError, List<MilkInfo>>> getDairyData({required String id}) async {
    return await _databaseService.getDairyData(id: id);
  }
}
