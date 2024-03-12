import 'package:dhood_app/data/utils/hive_constants.dart';
import 'package:hive/hive.dart';

part 'dairy_info.g.dart';

@HiveType(typeId: HiveConstants.dairyHiveId)
class DairyInfo extends HiveObject{

  @HiveField(0)
  bool? isLogedIn;

  @HiveField(1)
  String? id;

  @HiveField(2)
  String? name;
}
