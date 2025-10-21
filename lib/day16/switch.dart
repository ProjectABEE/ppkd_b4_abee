import 'package:flutter/material.dart';

class switchWidget extends StatefulWidget {
  const switchWidget({super.key});

  @override
  State<switchWidget> createState() => _switchWidgetState();
}

class _switchWidgetState extends State<switchWidget> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: isSwitched ? Color(0xff121212) : Color(0xffFFFFFF),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
            ),
            Text(
              isSwitched ? "Aktifkan Mode Terang" : "Aktifkan Mode Gelap",
              style: TextStyle(
                color: isSwitched ? Color(0xffFFFFFF) : Color(0xff121212),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
