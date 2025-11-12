import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/pikachu_model.dart' as list_model;
import '../model/pokemon_model.dart' as detail_model;

Future<List<list_model.Result>> fetchAllPokemon() async {
  final response = await http.get(
    Uri.parse("https://pokeapi.co/api/v2/pokemon?limit=1302"),
  );
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final List results = data['results'];
    return results.map((e) => list_model.Result.fromJson(e)).toList();
  } else {
    throw Exception("Gagal memuat daftar Pokémon");
  }
}

Future<detail_model.Pokemon> fetchPokemonDetail(String name) async {
  final response = await http.get(
    Uri.parse("https://pokeapi.co/api/v2/pokemon/$name"),
  );
  if (response.statusCode == 200) {
    return detail_model.Pokemon.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Gagal memuat detail Pokémon");
  }
}

Future<List<String>> fetchPokemonTypes() async {
  final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/type'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    List types = data['results'];
    return types.map<String>((t) => t['name'].toString()).toList();
  } else {
    throw Exception('Gagal mengambil tipe Pokémon');
  }
}

Future<List<list_model.Result>> fetchPokemonByType(String type) async {
  final response = await http.get(
    Uri.parse('https://pokeapi.co/api/v2/type/$type'),
  );
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    List pokemons = data['pokemon'];
    return pokemons
        .map<list_model.Result>((p) => list_model.Result.fromJson(p['pokemon']))
        .toList();
  } else {
    throw Exception('Gagal mengambil Pokémon berdasarkan tipe');
  }
}

Future<List<String>> fetchPokemonHeldItems(String name) async {
  final response = await http.get(
    Uri.parse("https://pokeapi.co/api/v2/pokemon/$name"),
  );
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final List items = data['held_items'];
    // ambil nama item dari nested json
    return items.map<String>((e) => e['item']['name'].toString()).toList();
  } else {
    throw Exception('Gagal memuat held items Pokémon');
  }
}

Future<List<String>> fetchPokemonEncounters(String name) async {
  final response = await http.get(
    Uri.parse("https://pokeapi.co/api/v2/pokemon/$name/encounters"),
  );
  if (response.statusCode == 200) {
    final List data = jsonDecode(response.body);
    if (data.isEmpty) return ["Tidak ditemukan di alam liar"];
    return data
        .map<String>((e) => e['location_area']['name'].toString())
        .toList();
  } else {
    throw Exception('Gagal memuat lokasi encounters Pokémon');
  }
}

Future<String> fetchAbilityDescription(String abilityName) async {
  final url = Uri.parse('https://pokeapi.co/api/v2/ability/$abilityName');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);

    final effectEntries = data['effect_entries'] as List;
    final englishEntry = effectEntries.firstWhere(
      (e) => e['language']['name'] == 'en',
      orElse: () => null,
    );
    return englishEntry != null
        ? englishEntry['short_effect']
        : 'No description available.';
  } else {
    throw Exception('Failed to load ability description');
  }
}
