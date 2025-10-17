import 'package:flutter/material.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({super.key});

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  bool obscurepass = true;
  bool box = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff256BE8), Color(0xff1CE2DA)],
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset("assets/images/group1.png")],
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      "Login",
                      style: TextStyle(fontSize: 30, fontFamily: 'Inter'),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Sign up",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w100,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text("Email"),
                        ),
                        Card(
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Masukan Email Anda',
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text('Password'),
                        ),
                        Card(
                          child: TextField(
                            obscureText: obscurepass,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Masukan Password anda',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  obscurepass = !obscurepass;
                                  setState(() {});
                                },
                                icon: Icon(
                                  obscurepass
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            box = !box;
                            setState(() {});
                          },
                          icon: Icon(
                            box
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                          ),
                        ),
                        Text("Remember Me"),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 18),
                          child: Text("Forgot Password"),
                        ),
                      ],
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
