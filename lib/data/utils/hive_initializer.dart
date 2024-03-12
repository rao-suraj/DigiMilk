import 'package:dhood_app/domain/models/dairy_info.dart';
import 'package:dhood_app/domain/models/farmer_info.dart';
import 'package:hive_flutter/adapters.dart';

class HiveInitializer {
  static Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(FarmerInfoAdapter());
    Hive.registerAdapter(DairyInfoAdapter());
  }
}
