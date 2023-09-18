import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'cloud_model.g.dart';

@JsonSerializable()
@immutable
final class Cloud with EquatableMixin {
  final int? all;

  Cloud({
    this.all,
  });

  factory Cloud.fromJson(Map<String, dynamic> json) => _$CloudFromJson(json);

  Map<String, dynamic> toJson() => _$CloudToJson(this);

  @override
  List<Object?> get props => [all];

  Cloud copyWith({
    int? all,
  }) {
    return Cloud(
      all: all ?? this.all,
    );
  }
}
