import 'package:flutter/material.dart';

class cekbox extends StatefulWidget {
  const cekbox({super.key});

  @override
  State<cekbox> createState() => _cekboxState();
}

class _cekboxState extends State<cekbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Syarat dan ketentuan")),
      body: Column(
        children: [
          Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (value) {
                  print(value);
                  print(
                    isChecked
                        ? "Saya menyetujui semua persyaratan yang berlaku"
                        : "Saya tidak menyetujui semua persyaratan yang berlaku",
                  );
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              Text(
                isChecked
                    ? "Lanjutkan pendaftaran diperbolehkan"
                    : "anda belum bisa melanjutkan",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
