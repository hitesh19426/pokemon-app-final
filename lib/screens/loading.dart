import 'package:flutter/material.dart';
import 'package:pokemon_app/services/api/pokemon.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  List<Pokemon> pokemonlist = [];
  static const int start = 1;
  static const int end = 4;

  void setupData() async {
    for (int i = start; i <= end; i++) {
      Pokemon pokemon = Pokemon(id: i);
      await pokemon.getData();
      pokemonlist.add(pokemon);
    }

    Navigator.pop(context, {
      'pokemonlist': pokemonlist,
    });
  }

  @override
  void initState() {
    super.initState();
    setupData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Loading Screen'),
      ),
      body: SpinKitCircle(
        color: Colors.white,
        size: 50,
      ),
    );
  }
}
