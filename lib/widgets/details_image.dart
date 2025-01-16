import 'package:deltech_challenge/constants/images.dart';
import 'package:deltech_challenge/controllers/details/details_controller.dart';
import 'package:flutter/material.dart';

class DetailsImage extends StatelessWidget {
  const DetailsImage({super.key, required this.controller});

  final DetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
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
    );
  }
}
