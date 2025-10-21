import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class Cusdrawer extends StatefulWidget {
  const Cusdrawer({super.key});

  @override
  State<Cusdrawer> createState() => _CusdrawerState();
}

class _CusdrawerState extends State<Cusdrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test")),
      drawer: SidebarX(
        controller: SidebarXController(selectedIndex: 0, extended: true),
        items: const [
          SidebarXItem(icon: Icons.home, label: 'Home'),
          SidebarXItem(icon: Icons.search, label: 'Search'),
        ],
      ),
      body: const Center(child: Text('Your app body')),
    );
  }
}
