import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'terms_model.g.dart';

@JsonSerializable()
@immutable
final class Terms with EquatableMixin {
  final int? offset;
  final String? value;

  Terms({
    this.offset,
    this.value,
  });

  factory Terms.fromJson(Map<String, dynamic> json) => _$TermsFromJson(json);

  Map<String, dynamic> toJson() => _$TermsToJson(this);

  @override
  List<Object?> get props => [offset, value];

  Terms copyWith({
    int? offset,
    String? value,
  }) {
    return Terms(
      offset: offset ?? this.offset,
      value: value ?? this.value,
    );
  }
}
