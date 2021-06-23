import 'package:flutter/material.dart';
import 'package:pokemon_app/services/api/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({required this.pokemon});

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
            // Expanded(
            //   child: Container(
            //     decoration: BoxDecoration(
            //       image: DecorationImage(
            //         image: NetworkImage(pokemon.imgurl),
            //         fit: BoxFit.contain,
            //       ),
            //     ),
            //   ),
            // ),
            Container(
              child: Image.network(pokemon.imgurl),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 5.0),
              child: Text(
                pokemon.name,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
