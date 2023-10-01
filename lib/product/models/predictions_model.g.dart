// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'predictions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Predictions _$PredictionsFromJson(Map<String, dynamic> json) => Predictions(
      description: json['description'] as String?,
      matchedSubstrings: (json['matchedSubstrings'] as List<dynamic>?)
          ?.map((e) => MatchedSubstrings.fromJson(e as Map<String, dynamic>))
          .toList(),
      placeId: json['placeId'] as String?,
      reference: json['reference'] as String?,
      structuredFormatting: json['structuredFormatting'] == null
          ? null
          : StructuredFormatting.fromJson(
              json['structuredFormatting'] as Map<String, dynamic>),
      terms: (json['terms'] as List<dynamic>?)
          ?.map((e) => Terms.fromJson(e as Map<String, dynamic>))
          .toList(),
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PredictionsToJson(Predictions instance) =>
    <String, dynamic>{
      'description': instance.description,
      'matchedSubstrings': instance.matchedSubstrings,
      'placeId': instance.placeId,
      'reference': instance.reference,
      'structuredFormatting': instance.structuredFormatting,
      'terms': instance.terms,
      'types': instance.types,
    };
