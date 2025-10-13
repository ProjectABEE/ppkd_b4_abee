import 'package:flutter/material.dart';

class Tugas1 extends StatelessWidget {
  const Tugas1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text("Profil Saya", style: TextStyle(fontSize: 30)),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nama : Abraham Adnan Kahar", style: TextStyle(fontSize: 20)),
          Row(
            children: [
              Icon(Icons.location_on),
              Text(
                "Jakarta",
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            ],
          ),
          Text(
            "Seorang Pelajar Yang Sedang Belajar Flutter",
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
