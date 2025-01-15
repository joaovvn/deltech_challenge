import 'package:deltech_challenge/constants/urls.dart';
import 'package:deltech_challenge/core/dio_client.dart';
import 'package:deltech_challenge/models/pokemon_details.dart';
import 'package:deltech_challenge/models/pokemon_list_item.dart';

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

  Future<PokemonListItem> searchPokemon(String search) async {
    try {
      final response = await dioClient.get('${AppUrls.pokemon}/$search');
      PokemonDetails pokemonDetails = PokemonDetails.fromJson(response.data);
      return PokemonListItem(
          name: pokemonDetails.name, url: response.realUri.toString());
    } catch (e) {
      rethrow;
    }
  }
}
