import 'package:json_annotation/json_annotation.dart';

part 'upload_milk_quality_params.g.dart';

@JsonSerializable()
class UploadMilkQualityParams {
  final String dairyId;
  final String farmerId;
  final int ph;
  final int temperature;
  final int fat;
  final int colors;
  final int quality;
  final Time time;

  UploadMilkQualityParams(
      {required this.dairyId,
      required this.farmerId,
      required this.ph,
      required this.temperature,
      required this.fat,
      required this.colors,
      required this.quality,
      required this.time});

  factory UploadMilkQualityParams.fromJson(Map<String, dynamic> json) =>
      _$UploadMilkQualityParamsFromJson(json);

  Map<String, dynamic> toJson() => _$UploadMilkQualityParamsToJson(this);
}

@JsonEnum()
enum Time {
  morining,
  eveling;

  static Time getTime() {
    // if time is grater then 13 its  considered as eveling
    return DateTime.now().hour >= 13 ? Time.eveling : Time.morining;
  }
}
