// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weakly_forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeaklyForecast _$WeaklyForecastFromJson(Map<String, dynamic> json) =>
    WeaklyForecast(
      cod: json['cod'] as String?,
      message: json['message'] as int?,
      cnt: json['cnt'] as int?,
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => ListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeaklyForecastToJson(WeaklyForecast instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'message': instance.message,
      'cnt': instance.cnt,
      'list': instance.list,
      'city': instance.city,
    };
