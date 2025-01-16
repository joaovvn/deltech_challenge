import 'package:deltech_challenge/core/dio_client.dart';
import 'package:deltech_challenge/models/pokemon_details.dart';
import 'package:deltech_challenge/models/type_details.dart';
import 'package:deltech_challenge/services/pokemon_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'details_controller.g.dart';

class DetailsController = DetailsControllerBase with _$DetailsController;

abstract class DetailsControllerBase with Store {
  FirebaseAuth auth = GetIt.instance<FirebaseAuth>();
  ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();

  late DioClient dioClient;
  late PokemonService pokemonService;
  late PokemonDetails pokemonDetails;
  List<String> weaknessesList = List<String>.empty(growable: true);

  @action
  init(PokemonDetails details) async {
    isLoading = true;
    dioClient = DioClient();
    pokemonService = PokemonService(dioClient);
    pokemonDetails = details;
    await getCharacteristics();
    await getTypeDetails(pokemonDetails);
    isLoading = false;
  }

  @observable
  bool isLoading = false;

  @observable
  late String characteristics;

  @action
  Future<void> getCharacteristics() async {
    try {
      characteristics =
          await pokemonService.fetchPokemonCharacteristics(pokemonDetails.id);
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<void> getTypeDetails(PokemonDetails pokemonDetails) async {
    try {
      final damageMultipliers = <String, double>{};
      for (var type in pokemonDetails.types) {
        TypeDetails? typeDetails =
            await pokemonService.fetchTypeDetails(type.name);
        if (typeDetails != null) {
          _updateDamageMultipliers(
              damageMultipliers, typeDetails.noDamageFrom, 0);
          _updateDamageMultipliers(
              damageMultipliers, typeDetails.halfDamageFrom, 0.5);
          _updateDamageMultipliers(
              damageMultipliers, typeDetails.doubleDamageFrom, 2);
        }
      }
      damageMultipliers.forEach((name, value) {
        if (value > 1) {
          weaknessesList.add(name);
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  void _updateDamageMultipliers(
      Map<String, double> multipliers, List<String> types, double factor) {
    for (var type in types) {
      final typeName = type;
      multipliers[typeName] = (multipliers[typeName] ?? 1.0) * factor;
    }
  }

  void navigateToHomePage(BuildContext context) {
    Navigator.of(context).pop();
  }
}
