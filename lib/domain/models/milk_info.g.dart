// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'milk_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MilkInfo _$MilkInfoFromJson(Map<String, dynamic> json) => MilkInfo(
      dairyId: json['dairyId'] as String,
      farmerId: json['farmerId'] as String,
      ph: json['ph'] as int,
      temperature: json['temperature'] as int,
      fat: json['fat'] as int,
      colors: json['colors'] as int,
      quality: json['quality'] as int,
      time: $enumDecode(_$TimeEnumMap, json['time']),
      date: json['date'] as String,
      quantity: json['quantity'] as int,
      totAmount: json['totAmount'] as int,
    );

Map<String, dynamic> _$MilkInfoToJson(MilkInfo instance) => <String, dynamic>{
      'dairyId': instance.dairyId,
      'farmerId': instance.farmerId,
      'ph': instance.ph,
      'temperature': instance.temperature,
      'fat': instance.fat,
      'colors': instance.colors,
      'quality': instance.quality,
      'time': _$TimeEnumMap[instance.time]!,
      'date': instance.date,
      'totAmount': instance.totAmount,
      'quantity': instance.quantity,
    };

const _$TimeEnumMap = {
  Time.morning: 'morning',
  Time.evening: 'evening',
};
