import 'package:dhood_app/data/data_source/remote/firebase_database.dart';
import 'package:dhood_app/data/utils/app_error.dart';
import 'package:dhood_app/domain/models/farmer_info.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

abstract class IFarmerRepository {
  Future<Either<AppError, FarmerInfo>> farmerLogin(
      {required String id, required String password});

  Future<Either<AppError, void>> getMilkData({required String id});

  Future<Either<AppError, List<FarmerInfo>>> getFarmerList();

  Future<Either<AppError, void>> addFarmer(
      {required String name, required String id, required String password});
}

@LazySingleton(as: IFarmerRepository)
class DairyWorkerRepository implements IFarmerRepository {
  final FirebaseDatabaseService _databaseService;

  DairyWorkerRepository(this._databaseService);

  @override
  Future<Either<AppError, FarmerInfo>> farmerLogin(
      {required String id, required String password}) async {
    return await _databaseService.farmerLogin(id: id, password: password);
  }
  
  @override
  Future<Either<AppError, void>> addFarmer({required String name, required String id, required String password}) async {
    return await _databaseService.addFarmer(name: name, id: id, password: password);
  }
  
  @override
  Future<Either<AppError, List<FarmerInfo>>> getFarmerList() async {
    return await _databaseService.getFarmerList();
  }
  
  @override
  Future<Either<AppError, void>> getMilkData({required String id}) async {
    return await _databaseService.getMilkData(id: id);
  }
}
