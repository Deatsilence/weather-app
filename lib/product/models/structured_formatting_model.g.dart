// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structured_formatting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StructuredFormatting _$StructuredFormattingFromJson(
        Map<String, dynamic> json) =>
    StructuredFormatting(
      mainText: json['mainText'] as String?,
      mainTextMatchedSubstrings:
          (json['mainTextMatchedSubstrings'] as List<dynamic>?)
              ?.map((e) =>
                  MainTextMatchedSubstrings.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$StructuredFormattingToJson(
        StructuredFormatting instance) =>
    <String, dynamic>{
      'mainText': instance.mainText,
      'mainTextMatchedSubstrings': instance.mainTextMatchedSubstrings,
    };
