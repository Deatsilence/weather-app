import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'matched_substrings_model.dart';
import 'structured_formatting_model.dart';
import 'terms_model.dart';
part 'predictions_model.g.dart';

@JsonSerializable()
@immutable
final class Predictions with EquatableMixin {
  final String? description;
  final List<MatchedSubstrings>? matchedSubstrings;
  final String? placeId;
  final String? reference;
  final StructuredFormatting? structuredFormatting;
  final List<Terms>? terms;
  final List<String>? types;

  Predictions({
    this.description,
    this.matchedSubstrings,
    this.placeId,
    this.reference,
    this.structuredFormatting,
    this.terms,
    this.types,
  });
  factory Predictions.fromJson(Map<String, dynamic> json) => _$PredictionsFromJson(json);

  Map<String, dynamic> toJson() => _$PredictionsToJson(this);

  @override
  List<Object?> get props => [description, matchedSubstrings, placeId, reference, structuredFormatting, terms, types];

  Predictions copyWith({
    String? description,
    List<MatchedSubstrings>? matchedSubstrings,
    String? placeId,
    String? reference,
    StructuredFormatting? structuredFormatting,
    List<Terms>? terms,
    List<String>? types,
  }) {
    return Predictions(
      description: description ?? this.description,
      matchedSubstrings: matchedSubstrings ?? this.matchedSubstrings,
      placeId: placeId ?? this.placeId,
      reference: reference ?? this.reference,
      structuredFormatting: structuredFormatting ?? this.structuredFormatting,
      terms: terms ?? this.terms,
      types: types ?? this.types,
    );
  }
}
