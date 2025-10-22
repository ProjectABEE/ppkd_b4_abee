import 'package:flutter/material.dart';

class listViewList extends StatefulWidget {
  const listViewList({super.key});

  @override
  State<listViewList> createState() => _listViewListState();
}

class _listViewListState extends State<listViewList> {
  final List<String> namaKategori = [
    "Buah-buahan",
    "Sayuran",
    "Elektronik",
    "Pakaian Pria",
    "Pakaian Wanita",
    "Alat Tulis Kantor",
    "Buku & Majalah",
    "Peralatan Dapur",
    "Makanan Ringan",
    "Minuman",
    "Mainan Anak",
    "Peralatan Olahraga",
    "Produk Kesehatan",
    "Kosmetik",
    "Obat-obatan",
    "Aksesoris Mobil",
    "Perabot Rumah",
    "Sepatu & Sandal",
    "Barang Bekas",
    "Voucher & Tiket",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text("List Kategori", style: TextStyle(fontSize: 20)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: namaKategori.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text(namaKategori[index]));
              },
            ),
          ),
        ],
      ),
    );
  }
}
