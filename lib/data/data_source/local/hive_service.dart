import 'package:dhood_app/data/utils/hive_constants.dart';
import 'package:dhood_app/domain/models/farmer_info.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

abstract class IHiveService {
  Future<FarmerInfo?> getFarmeInfo();

  Future<void> logOutFarmer();

  Future<void> loginFarmer({required FarmerInfo farmerInfo});
}

@LazySingleton(as: IHiveService)
class HiveService extends IHiveService {
  @override
  Future<FarmerInfo?> getFarmeInfo() async {
    final userBox = await Hive.openBox<FarmerInfo>(HiveConstants.farmerBox);
    return userBox.get(HiveConstants.farmeKey);
  }

  @override
  Future<void> logOutFarmer() async {
    final FarmerInfo farmerInfo = FarmerInfo()..isLogedIn = false;
    final userBox = await Hive.openBox<FarmerInfo>(HiveConstants.farmerBox);
    await userBox.put(HiveConstants.farmeKey, farmerInfo);
  }

  @override
  Future<void> loginFarmer({required FarmerInfo farmerInfo}) async {
    final userBox = await Hive.openBox<FarmerInfo>(HiveConstants.farmerBox);
    await userBox.put(HiveConstants.farmeKey, farmerInfo);
  }
}
