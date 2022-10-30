import 'package:flutter/material.dart';
import 'package:flutter_codigo_pokedex/models/pokemon.dart';
import 'package:flutter_codigo_pokedex/pages/detail_page.dart';
import 'package:flutter_codigo_pokedex/ui/general/colors.dart';
import 'package:flutter_codigo_pokedex/ui/widgets/item_type_widget.dart';

class ItemPokemonWidget extends StatelessWidget {
  // String name;
  // String image;
  // List<String> types;
Pokemon pokemon;

  ItemPokemonWidget({
    required this.pokemon
    // required this.name,
    // required this.image,
    // required this.types,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(pokemon: pokemon,)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: colorsPokemon[pokemon.type[0]],
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -20,
              right: -20,
              child: Image.asset(
                "assets/images/pokeball.png",
                height: 120,
                color: Colors.white.withOpacity(0.27),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pokemon.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Column(
                  //   children: types.map((e) => ItemTypeWidget()).toList(),
                  // )
                  ...pokemon.type
                      .map((e) => ItemTypeWidget(
                            text: e,
                          ))
                      .toList(),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.network(
                pokemon.img,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
