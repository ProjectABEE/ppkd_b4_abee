import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ppkd_b4_abee/eduSmart/model/pikachu_model.dart';

Future<Pokemon> fetchPokemonDetail(String nameOrId) async {
  final response = await http.get(
    Uri.parse("https://pokeapi.co/api/v2/pokemon/$nameOrId"),
  );
  if (response.statusCode == 200) {
    return Pokemon.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Gagal memuat detail Pokémon");
  }
}
