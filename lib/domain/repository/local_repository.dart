import 'package:dhood_app/data/data_source/local/hive_service.dart';
import 'package:dhood_app/domain/models/farmer_info.dart';
import 'package:injectable/injectable.dart';

abstract class ILocalRepository {
  Future<FarmerInfo?> getFarmeInfo();

  Future<void> logOutFarmer();

  Future<void> loginFarmer({required FarmerInfo farmerInfo});
}

@LazySingleton(as: ILocalRepository)
class LocalRepositoryImpl implements ILocalRepository {
  final IHiveService _hiveService;

  const LocalRepositoryImpl(this._hiveService);

  @override
  Future<FarmerInfo?> getFarmeInfo() async {
    return await _hiveService.getFarmeInfo();
  }

  @override
  Future<void> logOutFarmer() {
    return _hiveService.logOutFarmer();
  }

  @override
  Future<void> loginFarmer({required FarmerInfo farmerInfo}) {
    return _hiveService.loginFarmer(farmerInfo: farmerInfo);
  }
}
