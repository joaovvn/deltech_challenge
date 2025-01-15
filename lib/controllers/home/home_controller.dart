import 'package:deltech_challenge/core/dio_client.dart';
import 'package:deltech_challenge/models/pokemon_list_item.dart';
import 'package:deltech_challenge/services/pokemon_service.dart';
import 'package:deltech_challenge/views/login/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  FirebaseAuth auth = GetIt.instance<FirebaseAuth>();
  ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();

  late DioClient dioClient;
  late PokemonService pokemonService;

  @action
  init() {
    dioClient = DioClient();
    pokemonService = PokemonService(dioClient);
    getPokemonList();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !isLoading) {
        nextPagePokemonList();
      }
    });
  }

  @observable
  bool isLoading = false;

  @observable
  bool loggedOut = false;

  @observable
  List<PokemonListItem> pokemonList = List.empty();

  @action
  Future<void> getPokemonList() async {
    isLoading = true;
    try {
      pokemonList = await pokemonService.fetchPokemons();
    } catch (e) {
      rethrow;
    }
    isLoading = false;
  }

  @action
  Future<void> getPokemon(String search) async {
    try {
      if (search.isEmpty) {
        return getPokemonList();
      }
      pokemonList.clear();
      PokemonListItem? pokemon = await pokemonService.searchPokemon(search);
      pokemonList = [pokemon];
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<void> nextPagePokemonList() async {
    isLoading = true;
    try {
      pokemonList += await pokemonService.fetchNextPage();
    } catch (e) {
      rethrow;
    }
    isLoading = false;
  }

  @action
  Future<void> logout() async {
    isLoading = true;
    try {
      await auth.signOut();
      loggedOut = true;
    } catch (e) {
      rethrow;
    }
    isLoading = false;
  }

  @action
  void navigateToLoginPage(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => LoginView()));
  }
}
