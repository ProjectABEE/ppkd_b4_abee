import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ppkd_b4_abee/eduSmart/homepage.dart';

class BottomNavigationEDU extends StatefulWidget {
  const BottomNavigationEDU({super.key});

  @override
  State<BottomNavigationEDU> createState() => _BottomNavigationEDUState();
}

class _BottomNavigationEDUState extends State<BottomNavigationEDU> {
  int selectedindex = 0;
  static const List<Widget> widgetOptions = [HomePageEdu()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: const Color.fromARGB(255, 4, 161, 223).withOpacity(.1),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[100]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: const Color.fromARGB(253, 4, 154, 241),
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: const Color.fromARGB(52, 4, 154, 241),
              color: const Color.fromARGB(255, 113, 113, 114),
              selectedIndex: selectedindex,
              onTabChange: (index) {
                setState(() {
                  selectedindex = index;
                });
              },

              tabs: [
                GButton(icon: Icons.home, text: "Home"),
                GButton(icon: Icons.calendar_month, text: "Schedule"),
                GButton(icon: Icons.workspace_premium_outlined, text: "Grades"),
                GButton(icon: Icons.man, text: "Profile"),
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
