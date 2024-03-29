import 'package:json_annotation/json_annotation.dart';

part 'get_quality_response.g.dart';

@JsonSerializable()
class GetQualityResponse {
  final int grade;
  GetQualityResponse({required this.grade});

  factory GetQualityResponse.fromJson(Map<String, dynamic> json) =>
      _$GetQualityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetQualityResponseToJson(this);
}
