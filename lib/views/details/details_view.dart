import 'package:deltech_challenge/constants/images.dart';
import 'package:deltech_challenge/controllers/details/details_controller.dart';
import 'package:deltech_challenge/extensions/integer_extensions.dart';
import 'package:deltech_challenge/extensions/string_extensions.dart';
import 'package:deltech_challenge/models/pokemon_details.dart';
import 'package:deltech_challenge/utils/type_colors.dart';
import 'package:deltech_challenge/widgets/base_scaffold.dart';
import 'package:deltech_challenge/widgets/details_image.dart';
import 'package:deltech_challenge/widgets/details_info.dart';
import 'package:deltech_challenge/widgets/details_stats.dart';
import 'package:deltech_challenge/widgets/details_weaknesses.dart';
import 'package:deltech_challenge/widgets/loading_pokeball.dart';
import 'package:deltech_challenge/widgets/type_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key, required this.details});

  final PokemonDetails details;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  DetailsController controller = DetailsController();

  @override
  void initState() {
    controller.init(widget.details);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: TypeColors
          .pokemonTypeColors[controller.pokemonDetails.types.first.name]!,
      body: Stack(
        children: [
          Positioned.fill(
              child: Align(
            alignment: Alignment(2, -1.05),
            child: Image.asset(
              AppImages.pokeballOutlined,
              color: Colors.white24,
              height: 320,
            ),
          )),
          Positioned.fill(
              child: Align(
            alignment: Alignment(0.8, -1),
            child: DetailsImage(controller: controller),
          )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => controller.navigateToHomePage(context),
                        child: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      Text(
                        controller.pokemonDetails.id.idString,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text(
                        controller.pokemonDetails.name.capitalizeFirst,
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    controller.pokemonDetails.types.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    child: TypeCard(
                                        type: controller
                                            .pokemonDetails.types[index].name),
                                  );
                                }),
                          ),
                          Spacer(
                            flex: 3,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                    child: Observer(builder: (context) {
                      return controller.isLoading
                          ? Center(child: LoadingPokeball())
                          : Column(
                              children: [
                                DetailsInfo(controller: controller),
                                Divider(
                                  color: Colors.black87,
                                ),
                                DetailsWeaknesses(controller: controller),
                                Divider(
                                  color: Colors.black87,
                                ),
                                DetailsStats(controller: controller)
                              ],
                            );
                    }),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
