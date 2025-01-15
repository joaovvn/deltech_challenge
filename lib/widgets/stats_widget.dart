import 'package:deltech_challenge/constants/values.dart';
import 'package:deltech_challenge/models/pokemon_details.dart';
import 'package:flutter/material.dart';

class StatsWidget extends StatelessWidget {
  const StatsWidget({super.key, required this.pokemonStats});

  final PokemonStats pokemonStats;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              pokemonStats.name,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    pokemonStats.value.toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: LinearProgressIndicator(
                    minHeight: 5,
                    value: pokemonStats.value / 100,
                    borderRadius: AppValues.borderRadius,
                    backgroundColor: Colors.black12,
                    color: pokemonStats.value / 100 > 0.7
                        ? Colors.green
                        : pokemonStats.value / 100 < 0.35
                            ? Colors.red
                            : Colors.amber,
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
