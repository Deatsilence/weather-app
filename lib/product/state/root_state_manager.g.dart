// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'root_state_manager.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RootStateManager on RootStateManagerBase, Store {
  late final _$selectedIndexOfBottomNavigationBarAtom = Atom(
      name: 'RootStateManagerBase.selectedIndexOfBottomNavigationBar',
      context: context);

  @override
  int get selectedIndexOfBottomNavigationBar {
    _$selectedIndexOfBottomNavigationBarAtom.reportRead();
    return super.selectedIndexOfBottomNavigationBar;
  }

  @override
  set selectedIndexOfBottomNavigationBar(int value) {
    _$selectedIndexOfBottomNavigationBarAtom
        .reportWrite(value, super.selectedIndexOfBottomNavigationBar, () {
      super.selectedIndexOfBottomNavigationBar = value;
    });
  }

  late final _$RootStateManagerBaseActionController =
      ActionController(name: 'RootStateManagerBase', context: context);

  @override
  void setIndex(int value) {
    final _$actionInfo = _$RootStateManagerBaseActionController.startAction(
        name: 'RootStateManagerBase.setIndex');
    try {
      return super.setIndex(value);
    } finally {
      _$RootStateManagerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndexOfBottomNavigationBar: ${selectedIndexOfBottomNavigationBar}
    ''';
  }
}
