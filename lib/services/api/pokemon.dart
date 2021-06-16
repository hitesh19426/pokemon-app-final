import 'dart:convert';
import 'package:http/http.dart';

class Pokemon {
  int id = 0;
  String name = "";
  int baseExp = 0;
  int height = 0;
  int order = 0;
  int weight = 0;
  String imgurl = "";
  List<String> types = [];

  Pokemon({required this.id});

  Future<void> getData() async {
    try {
      String url = 'https://pokeapi.co/api/v2/pokemon/$id/';
      // print('url = $url');

      Response response = await get(Uri.parse(url));
      Map pokeData = jsonDecode(response.body);

      String nametemp = pokeData['name'];
      nametemp = nametemp.substring(0, 1).toUpperCase() + nametemp.substring(1);

      name = nametemp;
      baseExp = pokeData['base_experience'];
      height = pokeData['height'];
      order = pokeData['order'];
      weight = pokeData['weight'];
      imgurl = pokeData['sprites']['front_default'];

      for (var poketype in pokeData['types']) {
        String typetemp = poketype['type']['name'];
        typetemp =
            typetemp.substring(0, 1).toUpperCase() + typetemp.substring(1);
        types.add(typetemp);
      }
    } catch (error) {
      print(error);
      name = 'null';
    }
  }
}
