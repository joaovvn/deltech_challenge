class AppImages {
  static const String logo = 'assets/images/pokemon_logo.png';
  static const String pokeball = 'assets/images/pokeball.png';
  static const String pikachu = 'assets/images/pikachu.gif';
  static const String psyduck = 'assets/images/psyduck.png';
  static const String pokeballOutlined = 'assets/images/pokeball_outlined.png';

  static String getGifPath(int pokemonId) {
    return 'assets/images/pokemon_gifs/poke_$pokemonId.gif';
  }
}
