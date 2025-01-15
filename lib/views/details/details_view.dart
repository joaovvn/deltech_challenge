import 'package:deltech_challenge/constants/images.dart';
import 'package:deltech_challenge/controllers/details/details_controller.dart';
import 'package:deltech_challenge/extensions/integer_extensions.dart';
import 'package:deltech_challenge/extensions/string_extensions.dart';
import 'package:deltech_challenge/models/pokemon_details.dart';
import 'package:deltech_challenge/utils/type_colors.dart';
import 'package:deltech_challenge/widgets/base_scaffold.dart';
import 'package:deltech_challenge/widgets/loading_pokeball.dart';
import 'package:deltech_challenge/widgets/stats_widget.dart';
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
            child: Image.asset(
              AppImages.getGifPath(controller.pokemonDetails.id),
              errorBuilder: (context, error, stackTrace) => Image.network(
                controller.pokemonDetails.images.animated,
                fit: BoxFit.fitHeight,
                height: 160,
                errorBuilder: (context, error, stackTrace) => Image.network(
                  controller.pokemonDetails.images.frontDefault,
                  fit: BoxFit.fitHeight,
                  height: 160,
                ),
              ),
            ),
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
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text('Info',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Height",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black54),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                widget.details.height
                                                    .decimeterToMeter,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Weight",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black54),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                controller.pokemonDetails.weight
                                                    .hectogramToKilogram,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Characteristics",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black54),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                controller.characteristics,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Abilities",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black54),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  controller
                                                      .pokemonDetails.abilities
                                                      .map((ability) => ability
                                                          .name.capitalizeFirst)
                                                      .join(', '),
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Colors.black87,
                                ),
                                Column(
                                  children: [
                                    Text("Weaknesses",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    GridView(
                                      shrinkWrap: true,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 4,
                                              childAspectRatio: 3.0),
                                      children: controller.weaknessesList
                                          .map((weakness) {
                                        return TypeCard(type: weakness);
                                      }).toList(),
                                    )
                                  ],
                                ),
                                Divider(
                                  color: Colors.black87,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      Text('Stats',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Expanded(
                                        child: Column(
                                          children: controller
                                              .pokemonDetails.stats
                                              .map((pokemonStats) {
                                            return StatsWidget(
                                              pokemonStats: pokemonStats,
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
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
