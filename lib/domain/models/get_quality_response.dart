import 'package:json_annotation/json_annotation.dart';

part 'get_quality_response.g.dart';

@JsonSerializable()
class GetQualityResponse {
  final int predicted_grade;
  GetQualityResponse({required this.predicted_grade});

  factory GetQualityResponse.fromJson(Map<String, dynamic> json) =>
      _$GetQualityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetQualityResponseToJson(this);
}
