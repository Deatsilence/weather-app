import 'package:f_weather/product/models/base_model.dart';
import 'package:f_weather/product/models/city_model.dart';
import 'package:f_weather/product/models/list_model.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'weakly_forecast_model.g.dart';

@JsonSerializable()
@immutable
class WeaklyForecast extends BaseModel with EquatableMixin {
  final String? cod;
  final int? message;
  final int? cnt;
  final List<ListModel>? list;
  final City? city;

  WeaklyForecast({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });

  @override
  fromJson(Map<String, dynamic> json) => _$WeaklyForecastFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WeaklyForecastToJson(this);

  @override
  List<Object?> get props => [cod, message, cnt, list, city];

  WeaklyForecast copyWith({
    String? cod,
    int? message,
    int? cnt,
    List<ListModel>? list,
    City? city,
  }) {
    return WeaklyForecast(
      cod: cod ?? this.cod,
      message: message ?? this.message,
      cnt: cnt ?? this.cnt,
      list: list ?? this.list,
      city: city ?? this.city,
    );
  }
}
