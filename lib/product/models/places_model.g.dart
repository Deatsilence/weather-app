// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Places _$PlacesFromJson(Map<String, dynamic> json) => Places(
      predictions: (json['predictions'] as List<dynamic>?)
          ?.map((e) => Predictions.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$PlacesToJson(Places instance) => <String, dynamic>{
      'predictions': instance.predictions,
      'status': instance.status,
    };
