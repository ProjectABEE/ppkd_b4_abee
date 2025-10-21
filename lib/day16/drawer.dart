import 'package:flutter/material.dart';
import 'package:ppkd_b4_abee/day16/checkbox.dart';
import 'package:ppkd_b4_abee/day16/datepicker.dart';
import 'package:ppkd_b4_abee/day16/dropdown.dart';
import 'package:ppkd_b4_abee/day16/switch.dart';
import 'package:ppkd_b4_abee/day16/timepicker.dart';

class PageUtama extends StatefulWidget {
  const PageUtama({super.key});

  @override
  State<PageUtama> createState() => _PageUtamaState();
}

class _PageUtamaState extends State<PageUtama> {
  int selectedindex = 0;
  static const List<Widget> widgetOptions = [
    // Center(child: Text("Home")),
    cekbox(),
    switchWidget(),
    dropdownwidget(),
    DatePickerWidget(),
    AmbilWaktu(),
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
              title: Text("CheckBox"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(1);
              },
              leading: Icon(Icons.work),
              title: Text("Switch"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(2);
              },
              leading: Icon(Icons.work),
              title: Text("DropDown"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(3);
              },
              leading: Icon(Icons.work),
              title: Text("Date Picker"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(4);
              },
              leading: Icon(Icons.work),
              title: Text("Time Picker"),
            ),
          ],
        ),
      ),
      body: widgetOptions[selectedindex],
    );
  }
}
