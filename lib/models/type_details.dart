class TypeDetails {
  List<String> noDamageFrom;
  List<String> halfDamageFrom;
  List<String> doubleDamageFrom;

  TypeDetails(
      {required this.noDamageFrom,
      required this.halfDamageFrom,
      required this.doubleDamageFrom});

  factory TypeDetails.fromJson(Map<String, dynamic> json) {
    return TypeDetails(
        noDamageFrom:
            (json['damage_relations']['no_damage_from'] as List<dynamic>)
                .map((item) => item['name'] as String)
                .toList(),
        halfDamageFrom:
            (json['damage_relations']['half_damage_from'] as List<dynamic>)
                .map((item) => item['name'] as String)
                .toList(),
        doubleDamageFrom:
            (json['damage_relations']['double_damage_from'] as List<dynamic>)
                .map((item) => item['name'] as String)
                .toList());
  }
}
