import 'package:flutter/material.dart';

class Test1 extends StatelessWidget {
  const Test1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ini Test 1")),
      body: Column(
        children: [
          // Container dengan padding
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              color: Colors.blue,
              height: 50,
              child: const Center(
                child: Text("Login", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),

          // Jarak antar widget pakai SizedBox
          const SizedBox(height: 30),

          // Expanded dalam Row
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.red,
                  height: 30,
                  child: const Center(child: Text("Kotak 1")),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  color: Colors.green,
                  height: 50,
                  child: const Center(child: Text("Kotak 2")),
                ),
              ),
            ],
          ),

          // Spacer digunakan untuk mendorong widget
          Expanded(
            child: Column(
              children: [
                Container(
                  color: Colors.orange,
                  height: 30,
                  child: const Center(child: Text("Atas")),
                ),
                const Spacer(), // mendorong ke bawah
                Container(
                  color: Colors.purple,
                  height: 50,
                  child: const Center(child: Text("Bawah")),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
