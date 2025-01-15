// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_card_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonCardController on PokemonCardControllerBase, Store {
  late final _$pokemonDetailsAtom =
      Atom(name: 'PokemonCardControllerBase.pokemonDetails', context: context);

  @override
  PokemonDetails? get pokemonDetails {
    _$pokemonDetailsAtom.reportRead();
    return super.pokemonDetails;
  }

  @override
  set pokemonDetails(PokemonDetails? value) {
    _$pokemonDetailsAtom.reportWrite(value, super.pokemonDetails, () {
      super.pokemonDetails = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('PokemonCardControllerBase.init', context: context);

  @override
  Future init(PokemonListItem pokemon) {
    return _$initAsyncAction.run(() => super.init(pokemon));
  }

  late final _$getPokemonDetailsAsyncAction = AsyncAction(
      'PokemonCardControllerBase.getPokemonDetails',
      context: context);

  @override
  Future<PokemonDetails> getPokemonDetails(String url) {
    return _$getPokemonDetailsAsyncAction
        .run(() => super.getPokemonDetails(url));
  }

  @override
  String toString() {
    return '''
pokemonDetails: ${pokemonDetails}
    ''';
  }
}
