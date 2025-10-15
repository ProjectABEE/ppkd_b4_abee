import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

class Tugas3 extends StatelessWidget {
  const Tugas3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: AlignmentGeometry.topCenter,
                  end: AlignmentGeometry.bottomCenter,
                  colors: [
                    Color(0xff4E56C0),
                    Color(0xff9B5DE0),
                    Color(0xffD78FEE),
                    Color(0xffFDCFFA),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(bottom: 30)),
                  Text("Welcome", style: TextStyle(fontSize: 30)),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: DashedBorder.fromBorderSide(
                        dashLength: 15,
                        side: BorderSide(width: 2),
                        // color: Colors.white.withOpacity(0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(child: Text("Masukan Informasi Anda")),
                        Text("Nama"),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Masukkan Nama',
                          ),
                        ),
                        Text("Email"),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Masukkan Email',
                          ),
                        ),
                        Text("No HP"),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Masukan No Hp',
                          ),
                        ),
                        Text("Deskripsi"),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Masukan Deskripsi',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.all(8),
              child: Container(
                decoration: BoxDecoration(),
                child: Text(
                  "Galery",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
                  ),
                  child: Stack(
                    children: [
                      Text("+", style: TextStyle(fontSize: 50)),
                      // Image.asset("assets/images/abe2.png")
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
