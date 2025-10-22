import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ppkd_b4_abee/day16/Tentangapl.dart';
import 'package:ppkd_b4_abee/day16/cusdrawer.dart';

class pageButtonNav extends StatefulWidget {
  const pageButtonNav({super.key});

  @override
  State<pageButtonNav> createState() => _pageButtonNavState();
}

class _pageButtonNavState extends State<pageButtonNav> {
  int selectedindex = 0;
  static const List<Widget> widgetOptions = [
    // Center(child: Text("Home")),
    Cusdrawer(),
    tentangAPK(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1)),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              selectedIndex: selectedindex,
              onTabChange: (index) {
                setState(() {
                  selectedindex = index;
                });
              },

              tabs: [
                GButton(icon: Icons.home, text: "Home"),
                GButton(icon: Icons.settings, text: "Tentang Aplikasi"),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: selectedindex,
      //   onTap: (index) {
      //     print(index);
      //     setState(() {
      //       selectedindex = index;
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings ),
      //       label: "Tentang Aplikasi",
      //     ),
      //   ],
      // ),
      body: widgetOptions[selectedindex],
    );
  }
}
