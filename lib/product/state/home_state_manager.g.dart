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

  late final _$getCurrentCityNameAsyncAction =
      AsyncAction('HomeStateManagerBase.getCurrentCityName', context: context);

  @override
  Future<void> getCurrentCityName() {
    return _$getCurrentCityNameAsyncAction
        .run(() => super.getCurrentCityName());
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
  String toString() {
    return '''
getCityName: ${getCityName}
    ''';
  }
}
