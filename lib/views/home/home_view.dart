import 'package:deltech_challenge/constants/images.dart';
import 'package:deltech_challenge/controllers/home/home_controller.dart';
import 'package:deltech_challenge/models/pokemon_list_item.dart';
import 'package:deltech_challenge/theme/colors.dart';
import 'package:deltech_challenge/widgets/base_scaffold.dart';
import 'package:deltech_challenge/widgets/custom_text_field.dart';
import 'package:deltech_challenge/widgets/hero_logo.dart';
import 'package:deltech_challenge/widgets/loading_pokeball.dart';
import 'package:deltech_challenge/widgets/pokemon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = HomeController();

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Expanded(child: HeroLogo()),
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(
                    child: Text(controller.auth.currentUser!.displayName![0],
                        style: TextStyle(
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ),
                  Spacer(),
                  Expanded(
                    flex: 15,
                    child: Text(
                      'Hello, ${controller.auth.currentUser!.displayName!}!',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  IconButton(
                      onPressed: () => controller.logout(),
                      icon: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            Expanded(
              child: CustomTextField(
                controller: controller.searchController,
                onSubmitted: (value) => controller.getPokemon(value),
                isPassword: false,
                prefixIcon: Icon(Icons.search),
                hint: 'Search for a Pokémon name or ID',
              ),
            ),
            Expanded(
              flex: 10,
              child: Observer(builder: (context) {
                if (controller.isLoading) {
                  return Center(child: LoadingPokeball());
                }
                if (controller.pokemonList.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.psyduck,
                        height: 100,
                      ),
                      Text(
                        'Not found!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  );
                }
                return ListView.builder(
                    controller: controller.scrollController,
                    itemCount: controller.pokemonList.length,
                    itemBuilder: (context, index) {
                      PokemonListItem pokemon = controller.pokemonList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: PokemonCard(
                          pokemon: pokemon,
                        ),
                      );
                    });
              }),
            ),
            Observer(
              builder: (_) {
                if (controller.loggedOut) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    controller.navigateToLoginPage(context);
                  });
                }
                return SizedBox.shrink();
              },
            ),
          ]),
        ));
  }
}
