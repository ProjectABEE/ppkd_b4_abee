import 'package:flutter/material.dart';
import 'package:ppkd_b4_abee/day16/checkbox.dart';
import 'package:ppkd_b4_abee/day16/datepicker.dart';
import 'package:ppkd_b4_abee/day16/dropdown.dart';
import 'package:ppkd_b4_abee/day16/switch.dart';
import 'package:ppkd_b4_abee/day16/timepicker.dart';
import 'package:sidebarx/sidebarx.dart';

class Cusdrawer extends StatefulWidget {
  const Cusdrawer({super.key});

  @override
  State<Cusdrawer> createState() => _CusdrawerState();
}

class _CusdrawerState extends State<Cusdrawer> {
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
      appBar: AppBar(title: Text("Test")),
      drawer: SidebarX(
        controller: SidebarXController(selectedIndex: 0),
        items: [
          SidebarXItem(
            icon: Icons.work,
            label: 'CheckBox',
            onTap: () {
              onTapDrawer(0);
            },
          ),
          SidebarXItem(
            icon: Icons.work,
            label: 'Switch',
            onTap: () {
              onTapDrawer(1);
            },
          ),
          SidebarXItem(
            icon: Icons.work,
            label: 'DropDown',
            onTap: () {
              onTapDrawer(2);
            },
          ),
          SidebarXItem(
            icon: Icons.work,
            label: 'Date Picker',
            onTap: () {
              onTapDrawer(3);
            },
          ),
          SidebarXItem(
            icon: Icons.work,
            label: 'Time Picker',
            onTap: () {
              onTapDrawer(4);
            },
          ),
        ],
      ),
      body: widgetOptions[selectedindex],
    );
  }
}
