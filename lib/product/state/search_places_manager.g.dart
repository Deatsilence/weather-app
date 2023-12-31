// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_places_manager.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchPlacesManager on SearchPlacesManagerBase, Store {
  late final _$isActiveClearButtonAtom = Atom(
      name: 'SearchPlacesManagerBase.isActiveClearButton', context: context);

  @override
  bool get isActiveClearButton {
    _$isActiveClearButtonAtom.reportRead();
    return super.isActiveClearButton;
  }

  @override
  set isActiveClearButton(bool value) {
    _$isActiveClearButtonAtom.reportWrite(value, super.isActiveClearButton, () {
      super.isActiveClearButton = value;
    });
  }

  late final _$SearchPlacesManagerBaseActionController =
      ActionController(name: 'SearchPlacesManagerBase', context: context);

  @override
  void changeClearButtonState({bool isActive = false}) {
    final _$actionInfo = _$SearchPlacesManagerBaseActionController.startAction(
        name: 'SearchPlacesManagerBase.changeClearButtonState');
    try {
      return super.changeClearButtonState(isActive: isActive);
    } finally {
      _$SearchPlacesManagerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isActiveClearButton: ${isActiveClearButton}
    ''';
  }
}
