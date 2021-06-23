import 'package:flutter/material.dart';
import 'package:pokemon_app/customWidgets/pokemonDetailCard.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  dynamic pokemap = {};

  @override
  Widget build(BuildContext context) {
    pokemap = pokemap.isNotEmpty
        ? pokemap
        : ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Deatil Card Screen'),
      ),
      body: Center(child: PokemonDetailCard(pokemap: pokemap)),
    );
  }
}
