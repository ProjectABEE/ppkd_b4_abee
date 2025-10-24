import 'package:flutter/material.dart';
import 'package:ppkd_b4_abee/day18/preferences/preferences_handler.dart';
import 'package:ppkd_b4_abee/eduSmart/database/db_helper.dart';
import 'package:ppkd_b4_abee/eduSmart/login.dart';
import 'package:ppkd_b4_abee/eduSmart/model/student_model.dart';

class PageUtamaEdu extends StatefulWidget {
  const PageUtamaEdu({
    super.key,
    required this.email,
    required this.nama,
    required this.kelas,
    required this.umur,
  });
  final String email;
  final String nama;
  final String kelas;
  final String umur;
  @override
  State<PageUtamaEdu> createState() => _HalamanPenyambutState();
}

class _HalamanPenyambutState extends State<PageUtamaEdu> {
  @override
  Widget build(BuildContext context) {
    // final args =
    // ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // final nama = args['nama'];
    // final email = args['email'];w
    // final kelas = args['kelas'];

    return Scaffold(
      appBar: AppBar(title: Text('Halo ${widget.nama}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Selamat Datang!", style: TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            const Text("Berikut adalah informasi Anda:"),
            Text("Nama: ${widget.nama}"),
            Text("Email: ${widget.email}"),
            SizedBox(height: 30),
            FutureBuilder(
              future: DbHelper.getAllStudent(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  final data = snapshot.data as List<StudentModel>;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final items = data[index];
                        return Column(
                          children: [
                            ListTile(
                              title: Text(items.name),
                              subtitle: Text(items.email),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }
              },
            ),
            TextButton(
              onPressed: () {
                PreferenceHandler.removeLogin();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginEdu()),
                  (route) => false,
                );
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
