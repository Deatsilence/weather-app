// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_state_manager.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeStateManager on ThemeStateManagerBase, Store {
  late final _$themeAtom =
      Atom(name: 'ThemeStateManagerBase.theme', context: context);

  @override
  ThemeData get theme {
    _$themeAtom.reportRead();
    return super.theme;
  }

  @override
  set theme(ThemeData value) {
    _$themeAtom.reportWrite(value, super.theme, () {
      super.theme = value;
    });
  }

  late final _$isNightAtom =
      Atom(name: 'ThemeStateManagerBase.isNight', context: context);

  @override
  bool get isNight {
    _$isNightAtom.reportRead();
    return super.isNight;
  }

  @override
  set isNight(bool value) {
    _$isNightAtom.reportWrite(value, super.isNight, () {
      super.isNight = value;
    });
  }

  late final _$ThemeStateManagerBaseActionController =
      ActionController(name: 'ThemeStateManagerBase', context: context);

  @override
  void changeThemeData() {
    final _$actionInfo = _$ThemeStateManagerBaseActionController.startAction(
        name: 'ThemeStateManagerBase.changeThemeData');
    try {
      return super.changeThemeData();
    } finally {
      _$ThemeStateManagerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
theme: ${theme},
isNight: ${isNight}
    ''';
  }
}
