import 'package:flutter/material.dart';

class HomePageEdu extends StatefulWidget {
  const HomePageEdu({super.key});

  @override
  State<HomePageEdu> createState() => _HomePageEduState();
}

class _HomePageEduState extends State<HomePageEdu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Container(
          height: 200,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: Color(0xff0240DE),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Padding(padding: EdgeInsetsGeometry.all(8)),
              Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundImage: AssetImage('assets/images/abe2.png'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "welcome",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        "Abee",
                        style: TextStyle(color: Colors.white, fontSize: 26),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
