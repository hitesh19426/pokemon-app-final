import 'package:flutter/material.dart';
import 'package:pokemon_app/services/api/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.yellow[100],
        onTap: () {
          Navigator.pushNamed(context, '/detail', arguments: {
            'pokemon': pokemon,
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(child: Image.network(pokemon.imgurl)),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
              child: Text(
                pokemon.name,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
