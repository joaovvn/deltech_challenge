import 'package:deltech_challenge/controllers/details/details_controller.dart';
import 'package:deltech_challenge/extensions/integer_extensions.dart';
import 'package:deltech_challenge/extensions/string_extensions.dart';
import 'package:flutter/material.dart';

class DetailsInfo extends StatelessWidget {
  const DetailsInfo({super.key, required this.controller});

  final DetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                    controller.pokemonDetails.height.decimeterToMeter,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                    controller.pokemonDetails.weight.hectogramToKilogram,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                      controller.pokemonDetails.abilities
                          .map((ability) => ability.name.capitalizeFirst)
                          .join(', '),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
