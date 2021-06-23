import 'package:flutter/material.dart';
import 'package:pokemon_app/customWidgets/pokemoncard.dart';
import 'package:pokemon_app/services/api/pokemon.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map pokemondata = {};
  List<Pokemon> pokelist = [];
  bool loaded = false;

  Widget beforeLoaded() {
    return OptionalLoadBody();
  }

  Widget afterLoaded() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0.0,
      children: List.generate(pokelist.length, (index) {
        return PokemonCard(pokemon: pokelist[index]);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Screen'),
      ),
      body: (loaded ? afterLoaded() : beforeLoaded()),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          dynamic pokemon = await Navigator.pushNamed(context, '/loading');
          if (pokemon != null) {
            pokelist = pokemon['pokemonlist'];
          }
          setState(() {
            loaded = true;
          });
        },
        child: Icon(Icons.album),
        tooltip: 'Go to loading screen',
      ),
    );
  }
}

class OptionalLoadBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Press floating button to load data',
        style: TextStyle(
          color: Colors.grey[700],
          letterSpacing: 1.0,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
