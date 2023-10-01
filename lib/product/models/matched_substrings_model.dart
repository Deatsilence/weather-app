import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'matched_substrings_model.g.dart';

@JsonSerializable()
@immutable
final class MatchedSubstrings with EquatableMixin {
  final int? length;
  final int? offset;

  MatchedSubstrings({
    this.length,
    this.offset,
  });

  factory MatchedSubstrings.fromJson(Map<String, dynamic> json) => _$MatchedSubstringsFromJson(json);

  Map<String, dynamic> toJson() => _$MatchedSubstringsToJson(this);

  @override
  List<Object?> get props => [length, offset];

  MatchedSubstrings copyWith({
    int? length,
    int? offset,
  }) {
    return MatchedSubstrings(
      length: length ?? this.length,
      offset: offset ?? this.offset,
    );
  }
}
