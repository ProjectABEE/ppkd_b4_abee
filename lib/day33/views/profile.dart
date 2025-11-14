import 'package:flutter/material.dart';
import 'package:ppkd_b4_abee/day18/preferences/preferences_handler.dart';
import 'package:ppkd_b4_abee/day33/extensions/navigator.dart';
import 'package:ppkd_b4_abee/day33/models/loginmodel.dart' as loginModel;
import 'package:ppkd_b4_abee/day33/service/api.dart';
import 'package:ppkd_b4_abee/day33/views/login.dart';

class ProfilePageDay33 extends StatefulWidget {
  const ProfilePageDay33({super.key});

  @override
  State<ProfilePageDay33> createState() => _ProfilePageDay33State();
}

class _ProfilePageDay33State extends State<ProfilePageDay33> {
  loginModel.User? user;

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  loadProfile() async {
    try {
      final result = await AuthAPI.getProfile();
      setState(() {
        user = result;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Dummy Data
    final String name = user?.name ?? "Loading...";
    final String email = user?.email ?? "Loading...";
    final String avatarUrl =
        "https://i.pravatar.cc/150?img=3"; // dummy avatar online

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar
              CircleAvatar(
                radius: 55,
                backgroundImage: NetworkImage(avatarUrl),
              ),

              const SizedBox(height: 20),

              // Name
              Text(
                name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              // Email
              Text(
                email,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),

              const SizedBox(height: 30),

              // Menu Items
              _menuItem(
                icon: Icons.edit,
                text: "Edit Profile",
                onTap: () {
                  final nameController = TextEditingController(
                    text: user?.name ?? "",
                  );
                  final parentContext = context;
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        title: const Text("Edit Profile"),
                        content: TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: "Nama",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        actions: [
                          TextButton(
                            child: const Text("Batal"),
                            onPressed: () => Navigator.pop(context),
                          ),
                          ElevatedButton(
                            child: const Text("Simpan"),
                            onPressed: () async {
                              final newName = nameController.text.trim();

                              if (newName.isEmpty) return;

                              Navigator.pop(context); // tutup dialog

                              final token = await PreferenceHandler.getToken();

                              try {
                                final result = await AuthAPI.UpdateProfile(
                                  nama: newName,
                                  token: token!,
                                );

                                // Update UI
                                setState(() {
                                  user = result.data!.user;
                                });

                                // Notifikasi success
                                ScaffoldMessenger.of(
                                  parentContext,
                                ).showSnackBar(
                                  const SnackBar(
                                    content: Text("Profil berhasil diperbarui"),
                                  ),
                                );

                                await loadProfile();
                              } catch (e) {
                                ScaffoldMessenger.of(
                                  parentContext,
                                ).showSnackBar(
                                  SnackBar(content: Text(e.toString())),
                                );
                              }
                            },
                          ),
                        ],
                      );
                    },
                  );
                  // Arahkan ke halaman edit profile
                  // context.push(EditProfile());
                },
              ),

              _menuItem(
                icon: Icons.info_outline,
                text: "Versi Aplikasi",
                onTap: () {
                  showAboutDialog(
                    context: context,
                    applicationName: "EduSmart",
                    applicationVersion: "v1.0.0",
                  );
                },
              ),

              _menuItem(
                icon: Icons.logout,
                text: "Logout",
                textColor: Colors.red,
                iconColor: Colors.red,
                onTap: () {
                  // Hapus token + kembali ke login
                  // PreferenceHandler.clearToken();
                  PreferenceHandler.removeLogin();
                  PreferenceHandler.removeToken();
                  context.pushReplacement(LoginDay33());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable menu item
  Widget _menuItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    Color? textColor,
    Color? iconColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade100,
        ),
        child: Row(
          children: [
            Icon(icon, size: 26, color: iconColor ?? Colors.black87),
            const SizedBox(width: 15),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: textColor ?? Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }
}
