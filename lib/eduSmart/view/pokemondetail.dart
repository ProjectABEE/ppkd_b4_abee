import 'package:flutter/material.dart';
import 'package:ppkd_b4_abee/eduSmart/model/pokemon_model.dart' as detail_model;

import '../services/api.dart';

class PokemonDetailScreen extends StatelessWidget {
  final String name;

  const PokemonDetailScreen({super.key, required this.name});

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
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(name.toUpperCase()),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        elevation: 6,
      ),
      body: FutureBuilder<detail_model.Pokemon>(
        future: fetchPokemonDetail(name),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return const Center(child: Text("Tidak ada data"));
          }

          final pokemon = snapshot.data!;
          final imageUrl =
              pokemon.sprites?.other?.officialArtwork?.frontDefault ??
              pokemon.sprites?.frontDefault ??
              "";

          final types =
              pokemon.types?.map((e) => e.type?.name ?? "").toList() ?? [];
          final abilities =
              pokemon.abilities?.map((e) => e.ability?.name ?? "").toList() ??
              [];

          return SingleChildScrollView(
            child: Column(
              children: [
                // 🎨 Header dengan gradasi warna
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        getTypeColor(
                          types.isNotEmpty ? types.first : 'normal',
                        ).withOpacity(0.8),
                        Colors.white,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    children: [
                      Image.network(imageUrl, height: 160),
                      const SizedBox(height: 8),
                      Text(
                        pokemon.name!.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: types
                            .map(
                              (type) => Chip(
                                label: Text(
                                  type.toUpperCase(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                backgroundColor: getTypeColor(type),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),

                // 📊 Detail Info
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildStatItem(Icons.tag, "ID", "#${pokemon.id}"),
                              _buildStatItem(
                                Icons.height,
                                "Height",
                                "${pokemon.height} dm",
                              ),
                              _buildStatItem(
                                Icons.monitor_weight,
                                "Weight",
                                "${pokemon.weight} hg",
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // 💫 --- Abilities ---
                      _buildSectionTitle("💫 Abilities"),
                      abilities.isEmpty
                          ? const Text("Tidak memiliki ability")
                          : Wrap(
                              spacing: 8,
                              runSpacing: 4,
                              children: abilities.map((ability) {
                                return GestureDetector(
                                  onTap: () async {
                                    showDialog(
                                      context: context,
                                      builder: (_) => const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                      barrierDismissible: false,
                                    );

                                    try {
                                      final desc =
                                          await fetchAbilityDescription(
                                            ability,
                                          );
                                      if (context.mounted) {
                                        Navigator.pop(context); // tutup loading
                                        showDialog(
                                          context: context,
                                          builder: (_) => AlertDialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            title: Text(
                                              ability
                                                  .replaceAll('-', ' ')
                                                  .toUpperCase(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            content: Text(desc),
                                            actions: [
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: const Text("Tutup"),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    } catch (e) {
                                      if (context.mounted) {
                                        Navigator.pop(context); // tutup loading
                                        showDialog(
                                          context: context,
                                          builder: (_) => AlertDialog(
                                            title: const Text("Error"),
                                            content: Text(
                                              "Gagal memuat deskripsi ability.",
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: const Text("OK"),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    }
                                  },
                                  child: Chip(
                                    label: Text(
                                      ability.replaceAll('-', ' '),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    backgroundColor: Colors.orange.shade100,
                                  ),
                                );
                              }).toList(),
                            ),

                      const SizedBox(height: 20),

                      // 📈 --- Base Stats ---
                      _buildSectionTitle("📈 Base Stats"),
                      pokemon.stats == null || pokemon.stats!.isEmpty
                          ? const Text("Tidak ada data stats")
                          : Column(
                              children: pokemon.stats!.map((stat) {
                                final name = stat.stat?.name ?? "Unknown";
                                final value = stat.baseStat ?? 0;

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4.0,
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          name.toUpperCase(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: LinearProgressIndicator(
                                          value:
                                              value /
                                              200, // max 200 biar proporsional
                                          backgroundColor: Colors.grey.shade300,
                                          color: getTypeColor(
                                            types.isNotEmpty
                                                ? types.first
                                                : 'normal',
                                          ),
                                          minHeight: 10,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(value.toString()),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),

                      const SizedBox(height: 20),

                      // 🎒 --- Held Items ---
                      _buildSectionTitle("🎒 Held Items"),
                      FutureBuilder<List<String>>(
                        future: fetchPokemonHeldItems(name),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return const Text("Gagal memuat held items");
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return const Text("Tidak membawa item");
                          }
                          final items = snapshot.data!;
                          return Wrap(
                            spacing: 8,
                            runSpacing: 4,
                            children: items
                                .map(
                                  (item) => Chip(
                                    label: Text(item),
                                    backgroundColor: Colors.blue.shade100,
                                  ),
                                )
                                .toList(),
                          );
                        },
                      ),

                      const SizedBox(height: 20),

                      // 📍 --- Location Encounters ---
                      _buildSectionTitle("📍 Location Encounters"),
                      FutureBuilder<List<String>>(
                        future: fetchPokemonEncounters(name),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return const Text("Gagal memuat lokasi");
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return const Text("Tidak ditemukan di alam liar");
                          }
                          final locations = snapshot.data!;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: locations
                                .map(
                                  (loc) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 2.0,
                                    ),
                                    child: Text(
                                      "• ${loc.replaceAll('-', ' ')}",
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ),
                                )
                                .toList(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.redAccent),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(value),
      ],
    );
  }
}
