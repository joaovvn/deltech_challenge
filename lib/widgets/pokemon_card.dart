import 'package:deltech_challenge/constants/values.dart';
import 'package:deltech_challenge/controllers/pokemon_card/pokemon_card_controller.dart';
import 'package:deltech_challenge/extensions/string_extensions.dart';
import 'package:deltech_challenge/models/pokemon_list_item.dart';
import 'package:deltech_challenge/widgets/loading_pikachu.dart';
import 'package:deltech_challenge/widgets/type_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemon});

  final PokemonListItem pokemon;

  @override
  Widget build(BuildContext context) {
    PokemonCardController controller = PokemonCardController();
    controller.init(pokemon);
    return Container(
      decoration: BoxDecoration(
          borderRadius: AppValues.borderRadius, color: Colors.white),
      child: Observer(builder: (context) {
        if (controller.pokemonDetails == null) {
          return SizedBox(
              height: 100,
              width: 100,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: LoadingPikachu(),
              ));
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 100,
                width: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                      controller.pokemonDetails!.images.frontDefault),
                )),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#${controller.pokemonDetails!.id.toString()}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    controller.pokemonDetails!.name.capitalizeFirst,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: controller.pokemonDetails!.types.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TypeCard(
                          type: controller.pokemonDetails!.types[index].name),
                    );
                  }),
            ),
            Spacer()
          ],
        );
      }),
    );
  }
}
