class Pokemon {
  String name;
  String img;
  List<String> type;
  String numPokemon;
  String height;
  String weight;
  String candy;
  String candyCount;
  List<String> weaknesses;
  Pokemon({
    required this.name,
    required this.img,
    required this.type,
    required this.numPokemon,
    required this.height,
    required this.weight,
    required this.candy,
    required this.candyCount,
    required this.weaknesses,
  });

  factory Pokemon.fromJSON(Map<String, dynamic> json) => Pokemon(
        name: json["name"],
        img: json["img"],
        type: List<String>.from(json["type"].map((e)=>e)),
        numPokemon: json["num"],
        height: json["height"],
        weight: json["weight"],
        candy: json["candy"],
        candyCount: json["candy_count"] != null ? json["candy_count"].toString():'0',
        weaknesses: List<String>.from(json["weaknesses"].map((e)=>e)),
      );
}
