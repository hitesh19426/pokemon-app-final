import 'package:pokemon_app/screens/home.dart';
import 'package:pokemon_app/screens/loading.dart';
import 'package:pokemon_app/screens/pokemonlist.dart';
import 'package:pokemon_app/screens/datail.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      // home: Home(),
      debugShowCheckedModeBanner: true,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/detail': (context) => Detail(),
        '/loading': (context) => Loading(),
        'choosepokemon': (context) => PokemonList(),
      },
    ));
