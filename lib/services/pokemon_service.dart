import 'package:deltech_challenge/constants/urls.dart';
import 'package:deltech_challenge/core/dio_client.dart';
import 'package:deltech_challenge/models/pokemon_details.dart';
import 'package:deltech_challenge/models/pokemon_list_item.dart';
import 'package:deltech_challenge/models/type_details.dart';
import 'package:flutter/material.dart';

class PokemonService {
  final DioClient dioClient;

  PokemonService(this.dioClient);

  String? nextPage;

  Future<List<PokemonListItem>> fetchPokemons(
      {int limit = 20, int offset = 0}) async {
    try {
      final response =
          await dioClient.get('/pokemon?limit=$limit&offset=$offset');
      List<PokemonListItem> pokemons = [];

      for (var pokemon in response.data['results']) {
        pokemons.add(PokemonListItem.fromJson(pokemon));
      }

      nextPage = response.data['next'];

      return pokemons;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<PokemonListItem>> fetchNextPage() async {
    if (nextPage == null) {
      return List.empty();
    }
    try {
      final response = await dioClient.get(nextPage!);
      List<PokemonListItem> pokemons = [];

      for (var pokemon in response.data['results']) {
        pokemons.add(PokemonListItem.fromJson(pokemon));
      }

      nextPage = response.data['next'];

      return pokemons;
    } catch (e) {
      rethrow;
    }
  }

  Future<PokemonDetails> fetchPokemonDetails(String url) async {
    try {
      final response = await dioClient.get(url);
      return PokemonDetails.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> fetchPokemonCharacteristics(int id) async {
    try {
      final response = await dioClient.get('${AppUrls.characteristics}$id');
      for (var characteristics
          in (response.data['descriptions'] as List<dynamic>)) {
        if (characteristics['language']['name'] == 'en') {
          return characteristics['description'];
        }
      }
      return 'Unknown';
    } catch (e) {
      return 'Unknown';
    }
  }

  Future<PokemonListItem?> searchPokemon(String search) async {
    try {
      final response = await dioClient.get('${AppUrls.pokemon}/$search');
      PokemonDetails pokemonDetails = PokemonDetails.fromJson(response.data);
      return PokemonListItem(
          name: pokemonDetails.name, url: response.realUri.toString());
    } catch (e) {
      return null;
    }
  }

  Future<TypeDetails?> fetchTypeDetails(String type) async {
    try {
      final response = await dioClient.get('${AppUrls.type}/$type');
      return TypeDetails.fromJson(response.data);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
