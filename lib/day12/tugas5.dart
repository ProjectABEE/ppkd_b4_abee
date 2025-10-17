import 'package:flutter/material.dart';

class Tugas5 extends StatefulWidget {
  const Tugas5({super.key});

  @override
  State<Tugas5> createState() => _Tugas5State();
}

class _Tugas5State extends State<Tugas5> {
  bool nama = false;
  bool fav = false;
  bool share = false;
  bool save = false;
  bool selengkapnya = false;
  bool sentuh = false;
  int angka = 0;
  double counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("tambah $counter");
          counter--;
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text("Tugas 5")),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Column(
                children: [
                  Text(
                    nama ? "Nama Saya : " : "Nama Saya : Abee",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          print("Tampilkan Nama $nama");
                          nama = !nama;
                          setState(() {});
                        },
                        child: Text(
                          nama ? "Munculkan Nama" : "Sembunyikan Nama",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/images/abe.webp'),
                      ),
                      Text(
                        "Abee",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Icon(Icons.more_vert),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/Postingan.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          print("Tampilkan fav $fav");
                          fav = !fav;
                          setState(() {});
                        },
                        icon: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  fav ? Icons.favorite : Icons.favorite_border,
                                ),
                              ],
                            ),
                            Row(children: [Text(fav ? "Suka" : "")]),
                          ],
                        ),
                        color: fav ? Colors.red : Colors.grey,
                      ),
                      IconButton(
                        onPressed: () {
                          print("Tampilkan share $share");
                          share = !share;
                          setState(() {});
                        },
                        icon: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  share ? Icons.share : Icons.share_outlined,
                                ),
                              ],
                            ),
                            Row(children: [Text(share ? "Bagikan" : "")]),
                          ],
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          print("Tampilkan Save$save");
                          save = !save;
                          setState(() {});
                        },
                        icon: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  save ? Icons.bookmark : Icons.bookmark_border,
                                ),
                              ],
                            ),
                            Row(children: [Text(save ? "Saved" : "")]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
              child: Container(
                color: Colors.amber,
                child: SizedBox(width: double.infinity),
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
                    child: Center(child: Text(sentuh ? "Baaa" : "")),
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
      ),
    );
  }
}
