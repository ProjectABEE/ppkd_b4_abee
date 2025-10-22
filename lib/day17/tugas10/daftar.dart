import 'package:flutter/material.dart';
import 'package:ppkd_b4_abee/day17/tugas10/pagepenyambut.dart';

class dafarui extends StatefulWidget {
  const dafarui({super.key});

  @override
  State<dafarui> createState() => _dafaruiState();
}

class _dafaruiState extends State<dafarui> {
  bool isbuttonenable = false;
  final namacontroler = TextEditingController();
  final emailcontroler = TextEditingController();
  final domcontroler = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    emailcontroler.dispose();
    namacontroler.dispose();
    domcontroler.dispose();
  }

  void checkformfield() {
    setState(() {
      isbuttonenable =
          emailcontroler.text.isNotEmpty &&
          namacontroler.text.isNotEmpty &&
          domcontroler.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff256BE8), Color(0xff1CE2DA)],
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 150),
              Container(
                width: 343,
                height: 550,
                margin: EdgeInsets.only(bottom: 40),
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Text(
                      "Formulir",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Form(
                        key: formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Nama Lengkap"),
                            SizedBox(height: 8),
                            TextFormField(
                              controller: namacontroler,
                              autovalidateMode: AutovalidateMode.onUnfocus,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Masukan Nama Anda',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Nama Wajib Di Isi';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 8),
                            Text("Email"),
                            SizedBox(height: 8),
                            TextFormField(
                              controller: emailcontroler,
                              autovalidateMode: AutovalidateMode.onUnfocus,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Masukan Email Anda',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'email tidak boleh kosong';
                                }
                                if (!RegExp(
                                  r'^[^@]+@[^@]+\.[^@]+',
                                ).hasMatch(value)) {
                                  return 'format email tidak valid';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 8),
                            Text("Nomor Telepon"),
                            SizedBox(height: 8),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Masukan Nomor Telp Anda',
                              ),
                            ),
                            SizedBox(height: 8),
                            Text("Kota Domisili"),
                            SizedBox(height: 8),
                            TextFormField(
                              controller: domcontroler,
                              autovalidateMode: AutovalidateMode.onUnfocus,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Jakarta',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Masukan Kota Anda';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 8),
                            Center(
                              child: SizedBox(
                                width: 300,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff1D61E7),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              HalamanPenyambut(),
                                          settings: RouteSettings(
                                            arguments: {
                                              'nama': namacontroler.text,
                                              'kota': domcontroler.text,
                                              'email': emailcontroler.text,
                                            },
                                          ),
                                        ),
                                        (route) => false,
                                      );
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text("Daftar Berhasil"),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "Masukan Semua Data Dengan Benar",
                                          ),
                                        ),
                                      );
                                    }
                                    print('Nama: ${namacontroler.text}');
                                    print('Email: ${emailcontroler.text}');
                                    print('Kota: ${domcontroler.text}');
                                  },
                                  child: Text(
                                    "Daftar",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
