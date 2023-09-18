import 'package:f_weather/product/models/base_model.dart';
import 'package:f_weather/product/models/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'coord_model.dart';
import 'main_model.dart';
import 'wind_model.dart';
import 'cloud_model.dart';
import 'sys_model.dart';
part 'weather_forecast_model.g.dart';

@JsonSerializable()
@immutable
final class WeatherForecast extends BaseModel with EquatableMixin {
  final Coord? coord;
  final List<Weather>? weather;
  final String? base;
  final Main? main;
  final int? visibility;
  final Wind? wind;
  final Cloud? clouds;
  final int? dt;
  final Sys? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  WeatherForecast({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  @override
  fromJson(Map<String, dynamic> json) => _$WeatherForecastFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WeatherForecastToJson(this);

  @override
  List<Object?> get props => [coord, weather, base, main, visibility, wind, clouds, dt, sys, timezone, id, name, cod];

  WeatherForecast copyWith({
    Coord? coord,
    List<Weather>? weather,
    String? base,
    Main? main,
    int? visibility,
    Wind? wind,
    Cloud? clouds,
    int? dt,
    Sys? sys,
    int? timezone,
    int? id,
    String? name,
    int? cod,
  }) {
    return WeatherForecast(
      coord: coord ?? this.coord,
      weather: weather ?? this.weather,
      base: base ?? this.base,
      main: main ?? this.main,
      visibility: visibility ?? this.visibility,
      wind: wind ?? this.wind,
      clouds: clouds ?? this.clouds,
      dt: dt ?? this.dt,
      sys: sys ?? this.sys,
      timezone: timezone ?? this.timezone,
      id: id ?? this.id,
      name: name ?? this.name,
      cod: cod ?? this.cod,
    );
  }
}
