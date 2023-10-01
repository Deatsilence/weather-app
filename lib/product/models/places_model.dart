import 'package:f_weather/product/models/base_model.dart';
import 'package:f_weather/product/models/predictions_model.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'places_model.g.dart';

@JsonSerializable()
@immutable
final class Places extends BaseModel with EquatableMixin {
  final List<Predictions>? predictions;
  final String? status;

  Places({
    this.predictions,
    this.status,
  });

  @override
  fromJson(Map<String, dynamic> json) => _$PlacesFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PlacesToJson(this);

  @override
  List<Object?> get props => [predictions, status];

  Places copyWith({
    List<Predictions>? predictions,
    String? status,
  }) {
    return Places(
      predictions: predictions ?? this.predictions,
      status: status ?? this.status,
    );
  }
}
