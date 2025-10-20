import 'package:flutter/material.dart';
import 'package:ppkd_b4_abee/Day10/Tugas3.dart';
import 'package:ppkd_b4_abee/Day10/Tugas4.dart';
import 'package:ppkd_b4_abee/day12/tugas5.dart';

class TampilanAwal extends StatefulWidget {
  const TampilanAwal({super.key});

  @override
  State<TampilanAwal> createState() => _TampilanAwalState();
}

class _TampilanAwalState extends State<TampilanAwal> {
  int selectedindex = 0;
  static const List<Widget> widgetOptions = [
    // Center(child: Text("Home")),
    Tugas5(),
    Tugas4(),
    Tugas3(),
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
      appBar: AppBar(title: Text("Ini drawer")),
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
              title: Text("Tugas5"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(1);
              },
              leading: Icon(Icons.work),
              title: Text("Tugas4"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(2);
              },
              leading: Icon(Icons.work),
              title: Text("Tugas3"),
            ),
          ],
        ),
      ),
      // appBar: AppBar(
      //   title: Text("Ini Halaman Awal"),
      //   automaticallyImplyLeading: false,
      //   // automaticallyImplyLeading untuk menghilangan tombol back di app bar
      // ),
      body: widgetOptions[selectedindex],

      // body: Column(
      //   children: [
      //     TextButton(
      //       onPressed: () {
      //         Navigator.pop(context); // Pop Untuk Kembali ke halaman sebelumnya
      //       },
      //       child: Text("Back To Login"),
      //     ),
      //     TextButton(
      //       onPressed: () {
      //         Navigator.pushReplacement(
      //           //push replacement untuk ke halaman selanjutnya dan menghapus halaman sebelumnya
      //           context,
      //           MaterialPageRoute(builder: (context) => Tugas5()),
      //         );
      //       },
      //       child: Text("Go to tugas 5"),
      //     ),
      //     TextButton(
      //       onPressed: () {
      //         Navigator.pushAndRemoveUntil(
      //           // menghapus semua halaman di belakangnya biasa untuk login
      //           context,
      //           MaterialPageRoute(builder: (context) => Tugas4()),
      //           (route) => false,
      //         );
      //       },
      //       child: Text("Go To Tugas 4"),
      //     ),
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedindex,
        onTap: (index) {
          print(index);
          setState(() {
            selectedindex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "School"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
