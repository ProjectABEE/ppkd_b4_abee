import 'package:flutter/material.dart';

class tentangAPK extends StatelessWidget {
  const tentangAPK({super.key});

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
        ],
      ),
    );
  }
}
