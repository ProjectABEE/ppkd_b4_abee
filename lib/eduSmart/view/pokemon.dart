import 'package:flutter/material.dart';
import 'package:ppkd_b4_abee/eduSmart/view/pokemondetail.dart';
import 'package:shimmer/shimmer.dart';

import '../model/pikachu_model.dart';
import '../services/api.dart';

class ScreenPokemon extends StatefulWidget {
  const ScreenPokemon({super.key});

  @override
  State<ScreenPokemon> createState() => _ScreenPokemonState();
}

class _ScreenPokemonState extends State<ScreenPokemon> {
  List<Result> allPokemons = [];
  List<Result> filteredPokemons = [];
  List<String> types = [];
  bool isLoading = true;
  String query = "";
  String? selectedType;

  @override
  void initState() {
    super.initState();
    loadPokemons();
  }

  Future<void> loadPokemons() async {
    try {
      final results = await Future.wait([
        fetchAllPokemon(),
        fetchPokemonTypes(),
      ]);

      setState(() {
        allPokemons = results[0] as List<Result>;
        filteredPokemons = allPokemons;
        types = results[1] as List<String>;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      debugPrint("Error loading pokemons: $e");
    }
  }

  void searchPokemon(String keyword) {
    setState(() {
      query = keyword.toLowerCase();
      filteredPokemons = allPokemons
          .where((pokemon) => pokemon.name!.toLowerCase().contains(query))
          .toList();
    });
  }

  Future<void> filterByType(String? type) async {
    if (type == null || type.isEmpty) {
      setState(() => filteredPokemons = allPokemons);
      return;
    }

    setState(() => isLoading = true);
    final typePokemons = await fetchPokemonByType(type);
    setState(() {
      selectedType = type;
      filteredPokemons = typePokemons;
      isLoading = false;
    });
  }

  Color getTypeColor(String type) {
    switch (type) {
      case 'fire':
        return Colors.redAccent;
      case 'water':
        return Colors.blueAccent;
      case 'grass':
        return Colors.green;
      case 'electric':
        return Colors.amber;
      case 'psychic':
        return Colors.purpleAccent;
      case 'ice':
        return Colors.cyan;
      case 'dragon':
        return Colors.deepPurple;
      case 'dark':
        return Colors.brown;
      case 'fairy':
        return Colors.pinkAccent;
      default:
        return Colors.grey.shade400;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F9),
      body: CustomScrollView(
        slivers: [
          // 🧱 AppBar dengan gradient
          SliverAppBar(
            expandedHeight: 80,
            pinned: true,
            elevation: 4,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "Pokédex",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.redAccent, Colors.orangeAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),

          // 🧭 Body
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  // 🔍 Search Bar
                  TextField(
                    onChanged: searchPokemon,
                    decoration: InputDecoration(
                      hintText: "Cari Pokémon...",
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // 🧩 Dropdown Filter Type
                  DropdownButtonFormField<String>(
                    initialValue: selectedType,
                    hint: const Text("Pilih Type"),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    items: types
                        .map(
                          (t) => DropdownMenuItem(
                            value: t,
                            child: Text(t.toUpperCase()),
                          ),
                        )
                        .toList(),
                    onChanged: (value) => filterByType(value),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // 📦 GridView Pokémon
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (isLoading) return _buildShimmerCard();
                  final p = filteredPokemons[index];
                  final id = p.url!.split('/').where((e) => e.isNotEmpty).last;
                  final imageUrl =
                      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";

                  return AnimatedOpacity(
                    opacity: 1,
                    duration: Duration(milliseconds: 400 + (index * 50 % 300)),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PokemonDetailScreen(name: p.name!),
                        ),
                      ),
                      child: Hero(
                        tag: p.name!,
                        child: Container(
                          margin: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0.8),
                                getTypeColor(
                                  selectedType ?? 'normal',
                                ).withOpacity(0.25),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 8,
                                offset: const Offset(3, 4),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              // 🖼️ Gambar Pokémon
                              Align(
                                alignment: Alignment.center,
                                child: Image.network(
                                  imageUrl,
                                  height: 90,
                                  fit: BoxFit.contain,
                                ),
                              ),

                              // 🏷️ Nama Pokémon
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    p.name!.toUpperCase(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                childCount: isLoading
                    ? 8
                    : filteredPokemons.isEmpty
                    ? 0
                    : filteredPokemons.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.95,
              ),
            ),
          ),

          if (!isLoading && filteredPokemons.isEmpty)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    "⚠️ Tidak ditemukan Pokémon",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // 💡 Shimmer Loading Card
  Widget _buildShimmerCard() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
