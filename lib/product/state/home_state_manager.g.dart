// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state_manager.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStateManager on HomeStateManagerBase, Store {
  late final _$cityNameAtom =
      Atom(name: 'HomeStateManagerBase.cityName', context: context);

  @override
  String get cityName {
    _$cityNameAtom.reportRead();
    return super.cityName;
  }

  @override
  set cityName(String value) {
    _$cityNameAtom.reportWrite(value, super.cityName, () {
      super.cityName = value;
    });
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
cityName: ${cityName}
    ''';
  }
}
