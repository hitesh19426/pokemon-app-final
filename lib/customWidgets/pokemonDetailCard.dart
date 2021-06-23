import 'package:flutter/material.dart';

class PokemonDetailCard extends StatelessWidget {
  const PokemonDetailCard({required this.pokemap});

  final pokemap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Expanded(
            //   child: Container(
            //     decoration: BoxDecoration(
            //       image: DecorationImage(
            //         image: NetworkImage(pokemap['pokemon'].imgurl),
            //         fit: BoxFit.fill,
            //       ),
            //     ),
            //   ),
            // ),
            Container(
              child: Image.network(pokemap['pokemon'].imgurl),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 10),
              child: Text(
                pokemap['pokemon'].name,
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            Text(
              'Height = ${pokemap['pokemon'].height}',
              style: TextStyle(fontSize: 10.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Weight = ${pokemap['pokemon'].weight}',
              style: TextStyle(fontSize: 10.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Types',
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: pokemap['pokemon']
                  .types
                  .map<Widget>((type) => PokemonType(type: type))
                  .toList(),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}

class PokemonType extends StatelessWidget {
  final String type;
  const PokemonType({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Text(
        type,
        style: TextStyle(
          backgroundColor: Colors.orange,
          fontWeight: FontWeight.bold,
          fontSize: 10.0,
        ),
      ),
    );
  }
}
