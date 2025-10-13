import 'package:flutter/material.dart';

class Tugas2 extends StatelessWidget {
  const Tugas2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("MEBE", style: TextStyle(fontSize: 30)),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/abe.webp'),
          ),
          Text("Abee", style: TextStyle(fontSize: 30)),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              color: Colors.white,
              child: Row(
                children: [
                  Icon(Icons.mail),
                  SizedBox(height: 10),
                  Text("Abrahamadnank23@gmail.com"),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.phone),
                Text("085810474403"),
                Spacer(flex: 1),
                Text("Hubungi saya"),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.cyan,
                  ),
                  child: Row(children: [Text("Mengikuti"), Icon(Icons.person)]),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber,
                  ),
                  child: Row(children: [Text("Diikuti"), Icon(Icons.group)]),
                ),
              ),
            ],
          ),
          SizedBox(height: 1),
          Container(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(children: [Text("DEYYY!!! Bisinglahhh...")]),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[300],
                  ),
                  child: Column(
                    children: [
                      Row(children: [Text("Dashboard Anda")]),
                      Row(
                        children: [
                          Text("999 Tayangan dalam 30 hari terakhir."),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: Text("Edit Profile"),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: Text("Bagikan Profile"),
                ),
              ),

              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: Icon(Icons.person_add),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.lightBlue],
                ),
              ),
              margin: EdgeInsets.only(top: 300, bottom: 10),
              child: Center(child: Text("Created by Abee")),
            ),
          ),
        ],
      ),
    );
  }
}
