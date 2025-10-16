import 'package:flutter/material.dart';

class Tugas5 extends StatefulWidget {
  const Tugas5({super.key});

  @override
  State<Tugas5> createState() => _Tugas5State();
}

class _Tugas5State extends State<Tugas5> {
  bool nama = true;
  bool fav = true;
  bool selengkapnya = false;
  bool sentuh = false;
  int angka = 0;
  double counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tugas 5")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nama Saya Adalah ", style: TextStyle(fontSize: 20)),
          if (nama)
            Text(
              "Abee",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          Padding(
            padding: EdgeInsets.all(8),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  print("Tampilkan Nama $nama");
                  nama = !nama;
                  setState(() {});
                },
                child: Text(
                  nama ? "Sembunyikan Nama" : "Munculkan Nama",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: SizedBox(
              width: double.infinity,
              child: IconButton(
                onPressed: () {
                  print("Tampilkan fav $fav");
                  fav = !fav;
                  setState(() {});
                },
                icon: Icon(fav ? Icons.favorite : Icons.favorite_border),
                color: fav ? Colors.red : Colors.grey,
              ),
            ),
          ),
          Center(child: fav ? Text("Suka") : Text("")),
          if (selengkapnya)
            Text(
              "Saya suka belajar flutter karena flutter itu keren dan mudah untuk dipelajari. Flutter juga memiliki komunitas yang besar dan banyak sumber belajar yang tersedia secara online.",
              style: TextStyle(fontSize: 16),
            ),
          Padding(padding: EdgeInsets.all(8)),
          Card(
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  print("Tampilkan Selengkapnya $selengkapnya");
                  selengkapnya = !selengkapnya;
                  setState(() {});
                },
                child: Text("Tampilkan Selengkapnya"),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(8)),
          Text("Angka : $counter", style: TextStyle(fontSize: 20)),
          Card(
            child: SizedBox(
              width: double.infinity,
              child: FloatingActionButton(
                onPressed: () {
                  print("kurang$counter");
                  counter--;
                  setState(() {});
                },
                child: Icon(Icons.remove),
              ),
            ),
          ),
          Container(
            width: 400,
            height: 200,
            color: Colors.amberAccent,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: SizedBox(
                width: double.infinity,
                child: InkWell(
                  splashColor: Colors.green,
                  onTap: () {
                    print("Kotak Disentuh");
                    sentuh = !sentuh;
                    setState(() {});
                  },
                  child: sentuh
                      ? Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/poci.jpeg'),
                            ),
                          ),
                        )
                      : SizedBox(),
                ),
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: SizedBox(
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {
                    angka++;
                    setState(() {});
                    print("Ditambah 1 = $angka");
                  },
                  onDoubleTap: () {
                    angka += 2;
                    setState(() {});
                    print("Ditambah 2 = $angka");
                  },
                  onLongPress: () {
                    angka += 3;
                    setState(() {});
                    print(" Ditambah 3 = $angka");
                  },
                  child: Center(child: Text("Tekan aku")),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
