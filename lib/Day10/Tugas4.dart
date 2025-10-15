import 'package:flutter/material.dart';

class Tugas4 extends StatelessWidget {
  const Tugas4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(8),
        physics: BouncingScrollPhysics(),
        children: [
          Padding(padding: EdgeInsets.all(8)),
          Center(child: Text('Formulir', style: TextStyle(fontSize: 30))),
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nama"),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Masukan Nama Anda',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email"),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Masukan Email Anda',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("NO Handphone"),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Masukan No Handphone Anda',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Deskripsi"),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Masukan Deskripsi Anda',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
          Center(child: Text('Daftar Produk', style: TextStyle(fontSize: 16))),
          ListTile(
            leading: Image.asset('assets/images/penggaris.jpeg'),
            title: Text('Penggaris'),
            subtitle: Text('Rp 2.000'),
          ),
          ListTile(
            leading: Image.asset('assets/images/penghapus.jpeg'),
            title: Text('Penghapus'),
            subtitle: Text('Rp 1.000'),
          ),
          ListTile(
            leading: Image.asset('assets/images/pensil.jpeg'),
            title: Text('Pensil'),
            subtitle: Text('Rp 1.000'),
          ),
          ListTile(
            leading: Image.asset('assets/images/pulpen.jpeg'),
            title: Text('Pulpen'),
            subtitle: Text('Rp 3.000'),
          ),
          ListTile(
            leading: Image.asset('assets/images/rautan.jpeg'),
            title: Text('Rautan'),
            subtitle: Text('Rp 15.000'),
          ),
        ],
      ),
    );
  }
}
