import 'package:flutter/material.dart';
import 'package:ppkd_b4_abee/eduSmart/database/db_helper.dart';
import 'package:ppkd_b4_abee/eduSmart/model/student_model.dart';
import 'package:ppkd_b4_abee/eduSmart/pagepenyambut.dart';

class DaftarEdu extends StatefulWidget {
  const DaftarEdu({super.key});

  @override
  State<DaftarEdu> createState() => _DaftarEduState();
}

class _DaftarEduState extends State<DaftarEdu> {
  bool isbuttonenable = false;
  final TextEditingController namacontroler = TextEditingController();
  final TextEditingController emailcontroler = TextEditingController();
  final TextEditingController kelascontroler = TextEditingController();
  final TextEditingController umurcontroler = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    emailcontroler.dispose();
    namacontroler.dispose();
    kelascontroler.dispose();
    umurcontroler.dispose();
    passwordController.dispose();
  }

  void checkformfield() {
    setState(() {
      isbuttonenable =
          emailcontroler.text.isNotEmpty &&
          namacontroler.text.isNotEmpty &&
          kelascontroler.text.isNotEmpty &&
          umurcontroler.text.isNotEmpty &&
          passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool obscurepass = true;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
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
                SizedBox(height: 50),
                Container(
                  width: 343,
                  height: 700,
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
                                  errorStyle: TextStyle(
                                    fontSize: 0,
                                    color: Colors.red,
                                    height: 0,
                                  ),
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
                                  errorStyle: TextStyle(
                                    fontSize: 0,
                                    color: Colors.red,
                                    height: 0,
                                  ),
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
                              Text("Umur"),
                              SizedBox(height: 8),
                              TextFormField(
                                controller: umurcontroler,
                                autovalidateMode: AutovalidateMode.onUnfocus,
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    fontSize: 0,
                                    color: Colors.red,
                                    height: 0,
                                  ),
                                  border: OutlineInputBorder(),
                                  hintText: 'Masukan Umur Anda',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Umur Tidak Boleh Kosong';
                                  }
                                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                    return 'Masukan Umur dengan angka 1-99';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 8),
                              Text("Kelas"),
                              SizedBox(height: 8),
                              TextFormField(
                                controller: kelascontroler,
                                autovalidateMode: AutovalidateMode.onUnfocus,
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    fontSize: 0,
                                    color: Colors.red,
                                    height: 0,
                                  ),
                                  border: OutlineInputBorder(),
                                  hintText: 'Masukan Kelas Anda',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Masukan Kelas Anda';
                                  }
                                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                    return 'Masukan Kelas dengan angka 1-6';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 2),
                              Text("Password"),
                              const SizedBox(height: 4),
                              TextFormField(
                                controller: passwordController,
                                autovalidateMode: AutovalidateMode.onUnfocus,
                                obscureText: obscurepass,
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    fontSize: 0,
                                    color: Colors.red,
                                    height: 0,
                                  ),
                                  border: OutlineInputBorder(),
                                  hintText: 'Masukan Password anda',
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        obscurepass = !obscurepass;
                                      });
                                    },
                                    icon: Icon(Icons.visibility_off),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password tidak boleh kosong';
                                  }
                                  if (value.length < 8) {
                                    return 'Password minimal 8 karakter';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 4),
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
                                            builder: (context) => PageUtamaEdu(
                                              email: emailcontroler.text,
                                              nama: namacontroler.text,
                                              kelas: kelascontroler.text,
                                              umur: umurcontroler.text,
                                            ),
                                            // settings: RouteSettings(
                                            //   arguments: {
                                            //     'nama': namacontroler.text,
                                            //     'kelas': kelascontroler.text,
                                            //     'email': emailcontroler.text,
                                            //   },
                                            // ),
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
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text("Validasi eror"),
                                              content: Text(
                                                "Tolong isi semua dengan benar",
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("Ok"),
                                                ),
                                                // TextButton(
                                                //   onPressed: () {
                                                //     Navigator.pop(context);
                                                //   },
                                                //   child: Text("Ga Ok"),
                                                // ),
                                              ],
                                            );
                                          },
                                        );
                                        // ScaffoldMessenger.of(
                                        //   context,
                                        // ).showSnackBar(
                                        //   SnackBar(
                                        //     content: Text(
                                        //       "Masukan Semua Data Dengan Benar",
                                        //     ),
                                        //   ),
                                        // );
                                      }
                                      print('Nama: ${namacontroler.text}');
                                      print('Email: ${emailcontroler.text}');
                                      print('kelas: ${kelascontroler.text}');
                                      final StudentModel dataStudent =
                                          StudentModel(
                                            name: namacontroler.text,
                                            email: emailcontroler.text,
                                            classs: kelascontroler.text,
                                            age: int.parse(umurcontroler.text),
                                            password: passwordController.text,
                                          );
                                      DbHelper.registerUser(dataStudent);
                                    },
                                    child: Text(
                                      "Daftar",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "have an account?",
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                  const SizedBox(width: 1),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ],
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
      ),
    );
  }
}
