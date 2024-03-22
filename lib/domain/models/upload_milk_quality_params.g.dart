// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_milk_quality_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadMilkQualityParams _$UploadMilkQualityParamsFromJson(
        Map<String, dynamic> json) =>
    UploadMilkQualityParams(
      dairyId: json['dairyId'] as String,
      farmerId: json['farmerId'] as String,
      ph: json['ph'] as int,
      temperature: json['temperature'] as int,
      fat: json['fat'] as int,
      colors: json['colors'] as int,
      quality: json['quality'] as int,
      time: $enumDecode(_$TimeEnumMap, json['time']),
    );

Map<String, dynamic> _$UploadMilkQualityParamsToJson(
        UploadMilkQualityParams instance) =>
    <String, dynamic>{
      'dairyId': instance.dairyId,
      'farmerId': instance.farmerId,
      'ph': instance.ph,
      'temperature': instance.temperature,
      'fat': instance.fat,
      'colors': instance.colors,
      'quality': instance.quality,
      'time': _$TimeEnumMap[instance.time]!,
    };

const _$TimeEnumMap = {
  Time.morining: 'morining',
  Time.eveling: 'eveling',
};
