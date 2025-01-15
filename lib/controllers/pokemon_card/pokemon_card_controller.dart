import 'package:deltech_challenge/core/dio_client.dart';
import 'package:deltech_challenge/models/pokemon_details.dart';
import 'package:deltech_challenge/models/pokemon_list_item.dart';
import 'package:deltech_challenge/services/pokemon_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'pokemon_card_controller.g.dart';

class PokemonCardController = PokemonCardControllerBase
    with _$PokemonCardController;

abstract class PokemonCardControllerBase with Store {
  FirebaseAuth auth = GetIt.instance<FirebaseAuth>();

  late DioClient dioClient;
  late PokemonService pokemonService;

  @observable
  PokemonDetails? pokemonDetails;

  @action
  init(PokemonListItem pokemon) async {
    dioClient = DioClient();
    pokemonService = PokemonService(dioClient);
    pokemonDetails = await getPokemonDetails(pokemon.url);
  }

  @action
  Future<PokemonDetails> getPokemonDetails(String url) async {
    try {
      return pokemonService.fetchPokemonDetails(url);
    } catch (e) {
      rethrow;
    }
  }
}
