import 'package:flutter/material.dart';

class AmbilWaktu extends StatefulWidget {
  const AmbilWaktu({super.key});

  @override
  State<AmbilWaktu> createState() => _AmbilWaktuState();
}

class _AmbilWaktuState extends State<AmbilWaktu> {
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Atur Pengingat")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              selectedTime == null
                  ? "Belum ada waktu dipilih"
                  : "Pengingat diatur pukul : ${selectedTime!.format(context)}",
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final TimeOfDay? picked = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (picked != null) {
                setState(() {
                  selectedTime = picked;
                });
              }
            },
            child: const Text("Pilih Waktu Pengingat"),
          ),
        ],
      ),
    );
  }
}
