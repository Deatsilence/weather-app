import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'wind_model.g.dart';

@JsonSerializable()
@immutable
final class Wind with EquatableMixin {
  final double? speed;
  final int? deg;

  Wind({
    this.speed,
    this.deg,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  Map<String, dynamic> toJson() => _$WindToJson(this);

  @override
  List<Object?> get props => [speed, deg];

  Wind copyWith({
    double? speed,
    int? deg,
  }) {
    return Wind(
      speed: speed ?? this.speed,
      deg: deg ?? this.deg,
    );
  }
}
