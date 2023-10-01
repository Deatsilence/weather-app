import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'main_text_matched_substrings_model.g.dart';

@JsonSerializable()
@immutable
final class MainTextMatchedSubstrings with EquatableMixin {
  final int? length;
  final int? offset;

  MainTextMatchedSubstrings({
    this.length,
    this.offset,
  });

  factory MainTextMatchedSubstrings.fromJson(Map<String, dynamic> json) => _$MainTextMatchedSubstringsFromJson(json);

  Map<String, dynamic> toJson() => _$MainTextMatchedSubstringsToJson(this);

  @override
  List<Object?> get props => [length, offset];

  MainTextMatchedSubstrings copyWith({
    int? length,
    int? offset,
  }) {
    return MainTextMatchedSubstrings(
      length: length ?? this.length,
      offset: offset ?? this.offset,
    );
  }
}
