import 'package:deltech_challenge/controllers/details/details_controller.dart';
import 'package:deltech_challenge/widgets/type_card.dart';
import 'package:flutter/material.dart';

class DetailsWeaknesses extends StatelessWidget {
  const DetailsWeaknesses({super.key, required this.controller});

  final DetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Weaknesses",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        GridView(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, childAspectRatio: 3.0),
          children: controller.weaknessesList.map((weakness) {
            return TypeCard(type: weakness);
          }).toList(),
        )
      ],
    );
  }
}
