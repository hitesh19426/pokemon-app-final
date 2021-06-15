import 'package:flutter/material.dart';
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
    // return PokemonCard(pokemondata: pokemondata);
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
        title: const Text('Home Screen'),
      ),
      body: (loaded ? afterLoaded() : beforeLoaded()),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          dynamic pokemon = await Navigator.pushNamed(context, '/loading');
          if (pokemon != null) {
            pokelist = pokemon['pokemonlist'];
            // pokemondata = {
            //   'pokemonlist': pokemon,
            //   // 'id': pokemon['id'],
            //   // 'name': pokemon['name'],
            //   // 'baseExp': pokemon['baseExp'],
            //   // 'height': pokemon['height'],
            //   // 'order': pokemon['order'],
            //   // 'weight': pokemon['weight'],
            //   // 'imgurl': pokemon['imgurl'],
            // };
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
          print('${pokemon.name}');
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // height: 80,
              // width: 100,
              child: Image.network(pokemon.imgurl),
            ),
            // SizedBox(
            //   height: 3.0,
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
              child: Text(
                pokemon.name,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  // fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OptionalLoadBody extends StatelessWidget {
  const OptionalLoadBody({
    Key? key,
  }) : super(key: key);

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
