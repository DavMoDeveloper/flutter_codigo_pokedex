class Pokemon {
  String name;
  String img;
  List<String> type;
  String numPokemon;
  String height;
  Pokemon({
    required this.name,
    required this.img,
    required this.type,
    required this.numPokemon,
    required this.height,
  });

  factory Pokemon.fromJSON(Map<String, dynamic> json) => Pokemon(
        name: json["name"],
        img: json["img"],
        type: List<String>.from(json["type"].map((e)=>e)),
        numPokemon: json["num"],
        height: json["height"],
      );
}
