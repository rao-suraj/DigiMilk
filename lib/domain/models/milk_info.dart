import 'package:json_annotation/json_annotation.dart';

part 'milk_info.g.dart';

@JsonSerializable()
class MilkInfo {
  final String dairyId;
  final String farmerId;
  final int ph;
  final int temperature;
  final int fat;
  final int colors;
  final int quality;
  final Time time;
  final String date;
  final int totAmount;
  final int quantity;

  MilkInfo(
      {required this.dairyId,
      required this.farmerId,
      required this.ph,
      required this.temperature,
      required this.fat,
      required this.colors,
      required this.quality,
      required this.time,
      required this.date,
      required this.quantity,
      required this.totAmount});

  factory MilkInfo.fromJson(Map<String, dynamic> json) =>
      _$MilkInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MilkInfoToJson(this);
}

@JsonEnum()
enum Time {
  morning,
  evening;

  static Time getTime() {
    // if time is grater then 13 its  considered as eveling
    return DateTime.now().hour >= 13 ? Time.evening : Time.morning;
  }

  static Time fromString(String time) {
    switch (time) {
      case "morning":
        return Time.morning;
      case "evening":
        return Time.evening;
      default:
        throw Exception();
    }
  }

  static String toStringCustom(Time time) {
    switch (time) {
      case Time.morning:
        return "morning";
      case Time.evening:
        return "evening";
      default:
        throw Exception();
    }
  }
}
