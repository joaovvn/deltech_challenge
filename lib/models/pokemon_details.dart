class PokemonDetails {
  int id;
  String name;
  int height;
  int weight;
  List<PokemonType> types;
  PokemonSprites images;
  List<PokemonAbilities> abilities;
  List<PokemonStats> stats;

  PokemonDetails(
      {required this.id,
      required this.name,
      required this.height,
      required this.weight,
      required this.types,
      required this.images,
      required this.abilities,
      required this.stats});

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
        abilities: (json['abilities'] as List<dynamic>)
            .map((type) => PokemonAbilities.fromJson(type))
            .toList(),
        stats: (json['stats'] as List<dynamic>)
            .map((type) => PokemonStats.fromJson(type))
            .toList());
  }
}

class PokemonSprites {
  String frontDefault;
  String backDefault;
  String animated;

  PokemonSprites(
      {required this.frontDefault,
      required this.backDefault,
      required this.animated});

  factory PokemonSprites.fromJson(Map<String, dynamic> json) {
    return PokemonSprites(
        frontDefault: json['front_default'] ?? '',
        backDefault: json['back_default'] ?? '',
        animated: json['versions']['generation-v']['black-white']['animated']
                ['front_default'] ??
            '');
  }
}

class PokemonType {
  String name;

  PokemonType({
    required this.name,
  });

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    return PokemonType(name: json['type']['name']);
  }
}

class PokemonAbilities {
  String name;

  PokemonAbilities({
    required this.name,
  });

  factory PokemonAbilities.fromJson(Map<String, dynamic> json) {
    return PokemonAbilities(
      name: json['ability']['name'],
    );
  }
}

class PokemonStats {
  String name;
  int value;

  PokemonStats({required this.name, required this.value});

  factory PokemonStats.fromJson(Map<String, dynamic> json) {
    return PokemonStats(name: json['stat']['name'], value: json['base_stat']);
  }
}
