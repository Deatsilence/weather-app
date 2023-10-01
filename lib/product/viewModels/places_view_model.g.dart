// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlacesViewModel on _PlacesViewModelBase, Store {
  Computed<Places>? _$placesComputed;

  @override
  Places get places =>
      (_$placesComputed ??= Computed<Places>(() => super.places,
              name: '_PlacesViewModelBase.places'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: '_PlacesViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$_placesAtom =
      Atom(name: '_PlacesViewModelBase._places', context: context);

  @override
  Places get _places {
    _$_placesAtom.reportRead();
    return super._places;
  }

  @override
  set _places(Places value) {
    _$_placesAtom.reportWrite(value, super._places, () {
      super._places = value;
    });
  }

  late final _$getSelectedPlaceAsyncAction =
      AsyncAction('_PlacesViewModelBase.getSelectedPlace', context: context);

  @override
  Future<void> getSelectedPlace(String place) {
    return _$getSelectedPlaceAsyncAction
        .run(() => super.getSelectedPlace(place));
  }

  late final _$_PlacesViewModelBaseActionController =
      ActionController(name: '_PlacesViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_PlacesViewModelBaseActionController.startAction(
        name: '_PlacesViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_PlacesViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
places: ${places}
    ''';
  }
}
