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
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: Color(0xff0240DE),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
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
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome back,",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            "Abraham Adnan Kahar",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.notifications_none_outlined, size: 26),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0X605DB6DF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Student ID"),
                            Spacer(),
                            Text("Class"),
                          ],
                        ),
                        Row(
                          children: [
                            Text("2024-001"),
                            Spacer(),
                            Text("XI IPA 2"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: 325,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_month),
                        SizedBox(width: 10),
                        Text("Attendance"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
