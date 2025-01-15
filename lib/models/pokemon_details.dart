class PokemonDetails {
  int id;
  String name;
  int height;
  int weight;
  List<PokemonType> types;
  PokemonSprites images;

  PokemonDetails({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.types,
    required this.images,
  });

  factory PokemonDetails.fromJson(Map<String, dynamic> json) {
    return PokemonDetails(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      height: json['height'] ?? 0,
      weight: json['weight'] ?? 0,
      types: (json['types'] as List<dynamic>)
          .map((type) => PokemonType.fromJson(type))
          .toList(),
      images: PokemonSprites.fromJson(json['sprites']),
    );
  }
}

class PokemonSprites {
  String frontDefault;
  String backDefault;

  PokemonSprites({
    required this.frontDefault,
    required this.backDefault,
  });

  factory PokemonSprites.fromJson(Map<String, dynamic> json) {
    return PokemonSprites(
      frontDefault: json['front_default'] ?? '',
      backDefault: json['back_default'] ?? '',
    );
  }
}

class PokemonType {
  String name;

  PokemonType({
    required this.name,
  });

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    return PokemonType(
      name: json['type']['name'],
    );
  }
}
