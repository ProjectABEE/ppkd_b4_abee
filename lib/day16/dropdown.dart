import 'package:flutter/material.dart';

class dropdownwidget extends StatefulWidget {
  const dropdownwidget({super.key});

  @override
  State<dropdownwidget> createState() => _dropdownwidgetState();
}

class _dropdownwidgetState extends State<dropdownwidget> {
  String? DropDownValue;
  final List<String> listBelanjaan = [
    "Elektronik",
    "Pakaian",
    "Makanan",
    "Lainnya",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: DropdownButton(
              value: DropDownValue,
              items: listBelanjaan.map((String val) {
                return DropdownMenuItem(
                  value: val,
                  child: Text(val, style: TextStyle(color: Colors.black)),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  DropDownValue = value;
                });
              },
            ),
          ),
          Text("anda memilih : $DropDownValue"),
        ],
      ),
    );
  }
}
