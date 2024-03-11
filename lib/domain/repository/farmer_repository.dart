import 'package:dhood_app/data/data_source/remote/firebase_database.dart';
import 'package:dhood_app/data/utils/app_error.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

abstract class IFarmerRepository {
  Future<Either<AppError, void>> farmerLogin({required String id , required String password});
}

@LazySingleton(as: IFarmerRepository)
class DairyWorkerRepository implements IFarmerRepository {
  final FirebaseDatabaseService _databaseService;

  DairyWorkerRepository(this._databaseService);

  @override
  Future<Either<AppError, void>> farmerLogin(
      {required String id, required String password}) async {
    return await _databaseService.farmerLogin(id: id, password: password);
  }
}
