import 'package:flutter/material.dart';
import 'package:ppkd_b4_abee/day17/tugas9/listview_list.dart';
import 'package:ppkd_b4_abee/day17/tugas9/listview_list_map.dart';
import 'package:ppkd_b4_abee/day17/tugas9/listview_model.dart';

class DrawerTugas9 extends StatefulWidget {
  const DrawerTugas9({super.key});

  @override
  State<DrawerTugas9> createState() => _DrawerTugas9State();
}

class _DrawerTugas9State extends State<DrawerTugas9> {
  int selectedindex = 0;
  static const List<Widget> widgetOptions = [
    listViewList(),
    ListViewListMapKategori(),
    ListViewModel(),
  ];
  void onTapDrawer(int index) {
    setState(() {
      selectedindex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Halaman Utama")),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/abe2.png"),
              ),
              title: Text("Abeee"),
              subtitle: Text("Siswa"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(0);
              },
              leading: Icon(Icons.work),
              title: Text("ListView List"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(1);
              },
              leading: Icon(Icons.work),
              title: Text("ListView Map"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(2);
              },
              leading: Icon(Icons.work),
              title: Text("ListView Model"),
            ),
          ],
        ),
      ),
      body: widgetOptions[selectedindex],
    );
  }
}
