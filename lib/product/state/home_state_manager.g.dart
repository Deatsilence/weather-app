// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state_manager.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStateManager on HomeStateManagerBase, Store {
  Computed<String>? _$getCityNameComputed;

  @override
  String get getCityName =>
      (_$getCityNameComputed ??= Computed<String>(() => super.getCityName,
              name: 'HomeStateManagerBase.getCityName'))
          .value;
  Computed<double>? _$getLatComputed;

  @override
  double get getLat =>
      (_$getLatComputed ??= Computed<double>(() => super.getLat,
              name: 'HomeStateManagerBase.getLat'))
          .value;
  Computed<double>? _$getLonComputed;

  @override
  double get getLon =>
      (_$getLonComputed ??= Computed<double>(() => super.getLon,
              name: 'HomeStateManagerBase.getLon'))
          .value;

  late final _$_cityNameAtom =
      Atom(name: 'HomeStateManagerBase._cityName', context: context);

  @override
  String get _cityName {
    _$_cityNameAtom.reportRead();
    return super._cityName;
  }

  @override
  set _cityName(String value) {
    _$_cityNameAtom.reportWrite(value, super._cityName, () {
      super._cityName = value;
    });
  }

  late final _$_latAtom =
      Atom(name: 'HomeStateManagerBase._lat', context: context);

  @override
  double get _lat {
    _$_latAtom.reportRead();
    return super._lat;
  }

  @override
  set _lat(double value) {
    _$_latAtom.reportWrite(value, super._lat, () {
      super._lat = value;
    });
  }

  late final _$_lonAtom =
      Atom(name: 'HomeStateManagerBase._lon', context: context);

  @override
  double get _lon {
    _$_lonAtom.reportRead();
    return super._lon;
  }

  @override
  set _lon(double value) {
    _$_lonAtom.reportWrite(value, super._lon, () {
      super._lon = value;
    });
  }

  late final _$getCurrentCityNameAsyncAction =
      AsyncAction('HomeStateManagerBase.getCurrentCityName', context: context);

  @override
  Future<void> getCurrentCityName() {
    return _$getCurrentCityNameAsyncAction
        .run(() => super.getCurrentCityName());
  }

  late final _$getCurrentPositionAsyncAction =
      AsyncAction('HomeStateManagerBase.getCurrentPosition', context: context);

  @override
  Future<void> getCurrentPosition() {
    return _$getCurrentPositionAsyncAction
        .run(() => super.getCurrentPosition());
  }

  late final _$getSelectedPositionAsyncAction =
      AsyncAction('HomeStateManagerBase.getSelectedPosition', context: context);

  @override
  Future<void> getSelectedPosition(double lat, double lon) {
    return _$getSelectedPositionAsyncAction
        .run(() => super.getSelectedPosition(lat, lon));
  }

  late final _$HomeStateManagerBaseActionController =
      ActionController(name: 'HomeStateManagerBase', context: context);

  @override
  void setCityName(String name) {
    final _$actionInfo = _$HomeStateManagerBaseActionController.startAction(
        name: 'HomeStateManagerBase.setCityName');
    try {
      return super.setCityName(name);
    } finally {
      _$HomeStateManagerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPosition(double lat, double lon) {
    final _$actionInfo = _$HomeStateManagerBaseActionController.startAction(
        name: 'HomeStateManagerBase.setPosition');
    try {
      return super.setPosition(lat, lon);
    } finally {
      _$HomeStateManagerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getCityName: ${getCityName},
getLat: ${getLat},
getLon: ${getLon}
    ''';
  }
}
