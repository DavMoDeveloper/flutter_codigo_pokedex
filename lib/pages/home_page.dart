import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_codigo_pokedex/data/data.dart';
import 'package:flutter_codigo_pokedex/models/pokemon.dart';
import 'package:flutter_codigo_pokedex/ui/widgets/item_pokemon_widget.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pokemons = [];
  List<Pokemon> pokemonsModel = [];

  getDataPokemon() async {
    Uri _uri = Uri.parse(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      pokemonsModel =
          myMap["pokemon"].map<Pokemon>((e) => Pokemon.fromJSON(e)).toList();
      setState(() {});
    }else {
      print("Error");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    //getDataPokemon();
    pokemonsModel= Data().getData.map<Pokemon>((e) => Pokemon.fromJSON(e)).toList();
    print(pokemonsModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12.0,
              ),
              const Text(
                "Pokedex",
                style: TextStyle(
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              GridView.count(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 12.0,
                childAspectRatio: 1.35,
                children: pokemonsModel
                    .map(
                      (e) => ItemPokemonWidget(
                        // name: e.name,
                        // image: e.img,
                        // types: List<String>.from(e.type.map(
                        //   (item) => item,
                        // )),
                        pokemon: e,
                      ),
                    )
                    .toList(),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
