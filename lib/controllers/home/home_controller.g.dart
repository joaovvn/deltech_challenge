// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'HomeControllerBase.isLoading', context: context);

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

  late final _$loggedOutAtom =
      Atom(name: 'HomeControllerBase.loggedOut', context: context);

  @override
  bool get loggedOut {
    _$loggedOutAtom.reportRead();
    return super.loggedOut;
  }

  @override
  set loggedOut(bool value) {
    _$loggedOutAtom.reportWrite(value, super.loggedOut, () {
      super.loggedOut = value;
    });
  }

  late final _$pokemonListAtom =
      Atom(name: 'HomeControllerBase.pokemonList', context: context);

  @override
  List<PokemonListItem> get pokemonList {
    _$pokemonListAtom.reportRead();
    return super.pokemonList;
  }

  @override
  set pokemonList(List<PokemonListItem> value) {
    _$pokemonListAtom.reportWrite(value, super.pokemonList, () {
      super.pokemonList = value;
    });
  }

  late final _$getPokemonListAsyncAction =
      AsyncAction('HomeControllerBase.getPokemonList', context: context);

  @override
  Future<void> getPokemonList() {
    return _$getPokemonListAsyncAction.run(() => super.getPokemonList());
  }

  late final _$getPokemonAsyncAction =
      AsyncAction('HomeControllerBase.getPokemon', context: context);

  @override
  Future<void> getPokemon(String search) {
    return _$getPokemonAsyncAction.run(() => super.getPokemon(search));
  }

  late final _$nextPagePokemonListAsyncAction =
      AsyncAction('HomeControllerBase.nextPagePokemonList', context: context);

  @override
  Future<void> nextPagePokemonList() {
    return _$nextPagePokemonListAsyncAction
        .run(() => super.nextPagePokemonList());
  }

  late final _$logoutAsyncAction =
      AsyncAction('HomeControllerBase.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase', context: context);

  @override
  dynamic init() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.init');
    try {
      return super.init();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
loggedOut: ${loggedOut},
pokemonList: ${pokemonList}
    ''';
  }
}
