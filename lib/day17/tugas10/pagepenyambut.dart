import 'package:flutter/material.dart';

class HalamanPenyambut extends StatefulWidget {
  const HalamanPenyambut({super.key});

  @override
  State<HalamanPenyambut> createState() => _HalamanPenyambutState();
}

class _HalamanPenyambutState extends State<HalamanPenyambut> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final nama = args['nama'];
    final email = args['email'];
    final kota = args['kota'];

    return Scaffold(
      appBar: AppBar(title: Text('Halo $nama')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Selamat Datang!", style: TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            const Text("Berikut adalah informasi Anda:"),
            Text("Nama: $nama"),
            Text("Email: $email"),
            Text("Kota: $kota"),
          ],
        ),
      ),
    );
  }
}
