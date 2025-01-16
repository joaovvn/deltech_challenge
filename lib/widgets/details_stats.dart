import 'package:deltech_challenge/controllers/details/details_controller.dart';
import 'package:deltech_challenge/widgets/stats_widget.dart';
import 'package:flutter/material.dart';

class DetailsStats extends StatelessWidget {
  const DetailsStats({super.key, required this.controller});

  final DetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
              children: controller.pokemonDetails.stats.map((pokemonStats) {
                return StatsWidget(
                  pokemonStats: pokemonStats,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
