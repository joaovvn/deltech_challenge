// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailsController on DetailsControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'DetailsControllerBase.isLoading', context: context);

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

  late final _$characteristicsAtom =
      Atom(name: 'DetailsControllerBase.characteristics', context: context);

  @override
  String get characteristics {
    _$characteristicsAtom.reportRead();
    return super.characteristics;
  }

  bool _characteristicsIsInitialized = false;

  @override
  set characteristics(String value) {
    _$characteristicsAtom.reportWrite(
        value, _characteristicsIsInitialized ? super.characteristics : null,
        () {
      super.characteristics = value;
      _characteristicsIsInitialized = true;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('DetailsControllerBase.init', context: context);

  @override
  Future init(PokemonDetails details) {
    return _$initAsyncAction.run(() => super.init(details));
  }

  late final _$getCharacteristicsAsyncAction =
      AsyncAction('DetailsControllerBase.getCharacteristics', context: context);

  @override
  Future<void> getCharacteristics() {
    return _$getCharacteristicsAsyncAction
        .run(() => super.getCharacteristics());
  }

  late final _$getTypeDetailsAsyncAction =
      AsyncAction('DetailsControllerBase.getTypeDetails', context: context);

  @override
  Future<void> getTypeDetails(PokemonDetails pokemonDetails) {
    return _$getTypeDetailsAsyncAction
        .run(() => super.getTypeDetails(pokemonDetails));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
characteristics: ${characteristics}
    ''';
  }
}
