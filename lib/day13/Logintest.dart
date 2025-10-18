import 'package:flutter/material.dart';
import 'package:ppkd_b4_abee/day13/buttonwidger.dart';
import 'package:ppkd_b4_abee/day13/buttonwidget2.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({super.key});

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  bool obscurepass = true;
  bool box = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Gradient background full screen
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff256BE8), Color(0xff1CE2DA)],
          ),
        ),
        // Biar full tinggi layar
        width: double.infinity,
        height: double.infinity,

        // Biar bisa scroll kalau isi melebihi layar
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Image.asset("assets/images/grup.png"),
              const SizedBox(height: 10),
              SizedBox(height: 10),
              // Kotak login
              Container(
                width: 343,
                height: 620,
                margin: const EdgeInsets.only(bottom: 40),
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Sign Up Row
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
                        const SizedBox(width: 1),
                        ButtonWidget(text: "Sign Up"),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Email & Password
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Email"),
                            const SizedBox(height: 4),
                            TextFormField(
                              controller: emailController,
                              autovalidateMode: AutovalidateMode.onUnfocus,
                              decoration: InputDecoration(
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
                            const SizedBox(height: 12),
                            Text("Password"),
                            const SizedBox(height: 4),
                            TextFormField(
                              controller: passwordController,
                              autovalidateMode: AutovalidateMode.onUnfocus,
                              obscureText: obscurepass,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Masukan Password anda',
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obscurepass = !obscurepass;
                                    });
                                  },
                                  icon: Icon(
                                    obscurepass
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
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
                          ],
                        ),
                      ),
                    ),

                    // Remember Me & Forgot
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 8),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              box = !box;
                            });
                          },
                          icon: Row(
                            children: [
                              Icon(
                                box
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                              ),
                              Text("Remember Me"),
                            ],
                          ),
                        ),
                        // const Text("Remember Me"),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 18),
                          child: ButtonWidget(text: 'Forgot Password ?'),
                        ),
                      ],
                    ),
                    SizedBox(
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
                          if (formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Login Berhasil")),
                            );
                          }
                        },
                        child: Text(
                          "Log In",
                          style: TextStyle(color: Color(0xffFFFFFF)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Expanded(child: Divider(thickness: 1)),
                          SizedBox(width: 10),
                          Text("Or"),
                          SizedBox(width: 10),
                          Expanded(child: Divider(thickness: 1)),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: CustomLoginButton(
                        imagePath: ("assets/images/google.png"),
                        label: "Continue With Google",
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: CustomLoginButton(
                        imagePath: ("assets/images/facebook.png"),
                        label: "Continue With Facebook",
                      ),
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
