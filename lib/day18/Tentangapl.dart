import 'package:flutter/material.dart';
import 'package:ppkd_b4_abee/day13/Logintest.dart';
import 'package:ppkd_b4_abee/day18/preferences/preferences_handler.dart';

class TentangApkDay18 extends StatelessWidget {
  const TentangApkDay18({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tentang aplikasi")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Nama Pembuat : ABRAHAM ADNAN KAHAR")),
          Text("Versi APK : 1.0"),
          Text("INI APLIKASI TUGAS"),
          TextButton(
            onPressed: () {
              PreferenceHandler.removeLogin();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginUI()),
                (route) => false,
              );
            },
            child: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
