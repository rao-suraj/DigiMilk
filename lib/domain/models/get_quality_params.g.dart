// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_quality_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetQualityParams _$GetQualityParamsFromJson(Map<String, dynamic> json) =>
    GetQualityParams(
      ph: json['ph'] as int,
      temperature: json['temperature'] as int,
      fat: json['fat'] as int,
      colors: json['colors'] as int,
    );

Map<String, dynamic> _$GetQualityParamsToJson(GetQualityParams instance) =>
    <String, dynamic>{
      'ph': instance.ph,
      'temperature': instance.temperature,
      'fat': instance.fat,
      'colors': instance.colors,
    };
