import 'package:f_weather/product/models/cloud_model.dart';
import 'package:f_weather/product/models/weakly_main_model.dart';
import 'package:f_weather/product/models/weakly_sys_model.dart';
import 'package:f_weather/product/models/weakly_wind_model.dart';
import 'package:f_weather/product/models/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'list_model.g.dart';

@JsonSerializable()
@immutable
final class ListModel with EquatableMixin {
  final int? dt;
  final Main? main;
  final List<Weather>? weather;
  final Cloud? clouds;
  final Wind? wind;
  final int? visibility;
  final double? pop;
  final Sys? sys;
  final String? dtTxt;

  ListModel({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.sys,
    this.dtTxt,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) => _$ListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListModelToJson(this);

  @override
  List<Object?> get props => [dt, main, weather, clouds, wind, visibility, pop, sys, dtTxt];

  ListModel copyWith({
    int? dt,
    Main? main,
    List<Weather>? weather,
    Cloud? clouds,
    Wind? wind,
    int? visibility,
    double? pop,
    Sys? sys,
    String? dtTxt,
  }) {
    return ListModel(
      dt: dt ?? this.dt,
      main: main ?? this.main,
      weather: weather ?? this.weather,
      clouds: clouds ?? this.clouds,
      wind: wind ?? this.wind,
      visibility: visibility ?? this.visibility,
      pop: pop ?? this.pop,
      sys: sys ?? this.sys,
      dtTxt: dtTxt ?? this.dtTxt,
    );
  }
}
