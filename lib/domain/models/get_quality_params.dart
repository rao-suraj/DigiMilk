import 'package:json_annotation/json_annotation.dart';

part 'get_quality_params.g.dart';

@JsonSerializable()
class GetQualityParams {
  final double ph;
  final int temperature;
  final int fat;
  final int colour;
  GetQualityParams({required this.ph,required this.temperature,required this.fat,required this.colour});

  factory GetQualityParams.fromJson(Map<String, dynamic> json) =>
      _$GetQualityParamsFromJson(json);

  Map<String, dynamic> toJson() => _$GetQualityParamsToJson(this);
}
