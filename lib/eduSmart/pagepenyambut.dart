import 'package:flutter/material.dart';
import 'package:ppkd_b4_abee/day18/preferences/preferences_handler.dart';
import 'package:ppkd_b4_abee/eduSmart/database/db_helper.dart';
import 'package:ppkd_b4_abee/eduSmart/login.dart';
import 'package:ppkd_b4_abee/eduSmart/model/student_model.dart';
import 'package:ppkd_b4_abee/eduSmart/widget/textfieldwidget.dart';

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
  getData() {
    DbHelper.getAllStudent();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Future<void> onEdit(StudentModel student) async {
      final editNameC = TextEditingController(text: student.name);
      final editAgeC = TextEditingController(text: student.age.toString());
      final editClasssC = TextEditingController(text: student.classs);
      final editEmailC = TextEditingController(text: student.email);
      final editPassC = TextEditingController(text: student.password);
      final res = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Edit Data"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 12,
              children: [
                Textfield(nama: "Name", controler: editNameC),
                Textfield(nama: "Email", controler: editEmailC),
                Textfield(nama: "Age", controler: editAgeC),
                Textfield(nama: "Classs", controler: editClasssC),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Batal"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text("Simpan"),
              ),
            ],
          );
        },
      );

      if (res == true) {
        final updated = StudentModel(
          id: student.id,
          name: editNameC.text,
          email: editEmailC.text,
          classs: editClasssC.text,
          age: int.parse(editAgeC.text),
          password: editPassC.text,
        );
        DbHelper.updateStudent(updated);
        getData();
        ScaffoldMessenger(child: Text("data berhasil di perbarui"));
      }
    }

    Future<void> onDelete(StudentModel student) async {
      final res = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Hapus Data"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 12,
              children: [
                Text(
                  "Apakah anda yakin ingin menghapus data ${student.name}?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Jangan"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text("Ya, hapus aja"),
              ),
            ],
          );
        },
      );

      if (res == true) {
        DbHelper.deleteStudent(student.id!);
        getData();
        ScaffoldMessenger(child: Text("data berhasil di hapus"));
      }
    }
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
                              subtitle: Text(
                                '${items.email} | Umur: ${items.age} | Kelas: ${items.classs}',
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      onEdit(items);
                                    },
                                    icon: Icon(Icons.edit),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      onDelete(items);
                                    },
                                    icon: Icon(Icons.delete, color: Colors.red),
                                  ),
                                ],
                              ),
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
