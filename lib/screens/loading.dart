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
  static const int end = 50;

  void setupData() async {
    for (int i = start; i <= end; i++) {
      Pokemon pokemon = Pokemon(id: i);
      await pokemon.getData();

      // print('id = ${pokemon.id}');
      // print('base experience = ${pokemon.baseExp}');
      // print('name = ${pokemon.name}');
      // print('height = ${pokemon.height}');
      // print('order = ${pokemon.order}');
      // print('weight = ${pokemon.weight}');
      // print('url of image = ${pokemon.imgurl}');

      pokemonlist.add(pokemon);
    }

    for (int i = start - 1; i <= end - 1; i++) {
      // print('id = ${pokemonlist[i].id}');
      // print('base experience = ${pokemonlist[i].baseExp}');
      // print('name = ${pokemonlist[i].name}');
      // print('height = ${pokemonlist[i].height}');
      // print('order = ${pokemonlist[i].order}');
      // print('weight = ${pokemonlist[i].weight}');
      // print('url of image = ${pokemonlist[i].imgurl}');
    }

    Navigator.pop(context, {
      'pokemonlist': pokemonlist,
      // 'id': pokemon.id,
      // 'name': pokemon.name,
      // 'baseExp': pokemon.baseExp,
      // 'height': pokemon.height,
      // 'order': pokemon.order,
      // 'weight': pokemon.weight,
      // 'imgurl': pokemon.imgurl,
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
        title: Text(
          'Loading Screen',
        ),
      ),
      body: SpinKitCircle(
        color: Colors.white,
        size: 50,
      ),
    );
  }
}
