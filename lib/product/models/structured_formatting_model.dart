import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'main_text_matched_substrings_model.dart';
part 'structured_formatting_model.g.dart';

@JsonSerializable()
@immutable
final class StructuredFormatting with EquatableMixin {
  final String? mainText;
  final List<MainTextMatchedSubstrings>? mainTextMatchedSubstrings;

  StructuredFormatting({
    this.mainText,
    this.mainTextMatchedSubstrings,
  });

  factory StructuredFormatting.fromJson(Map<String, dynamic> json) => _$StructuredFormattingFromJson(json);

  Map<String, dynamic> toJson() => _$StructuredFormattingToJson(this);

  @override
  List<Object?> get props => [mainText, mainTextMatchedSubstrings];

  StructuredFormatting copyWith({
    String? mainText,
    List<MainTextMatchedSubstrings>? mainTextMatchedSubstrings,
  }) {
    return StructuredFormatting(
      mainText: mainText ?? this.mainText,
      mainTextMatchedSubstrings: mainTextMatchedSubstrings ?? this.mainTextMatchedSubstrings,
    );
  }
}
