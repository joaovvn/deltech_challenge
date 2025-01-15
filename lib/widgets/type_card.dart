import 'package:deltech_challenge/constants/values.dart';
import 'package:deltech_challenge/utils/type_colors.dart';
import 'package:flutter/material.dart';

class TypeCard extends StatelessWidget {
  const TypeCard({super.key, required this.type});

  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: TypeColors.pokemonTypeColors[type],
          borderRadius: AppValues.borderRadius),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Center(
            child: Text(
          type,
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
