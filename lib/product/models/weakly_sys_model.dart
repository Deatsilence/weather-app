import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'weakly_sys_model.g.dart';

@JsonSerializable()
@immutable
class Sys with EquatableMixin {
  final String? pod;

  Sys({
    this.pod,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);

  Map<String, dynamic> toJson() => _$SysToJson(this);

  @override
  List<Object?> get props => [pod];

  Sys copyWith({
    String? pod,
  }) {
    return Sys(
      pod: pod ?? this.pod,
    );
  }
}
