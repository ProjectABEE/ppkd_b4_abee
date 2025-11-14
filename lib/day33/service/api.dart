import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:ppkd_b4_abee/day18/preferences/preferences_handler.dart';
import 'package:ppkd_b4_abee/day33/constant/endpoint.dart';
import 'package:ppkd_b4_abee/day33/models/loginmodel.dart' as loginModel;
import 'package:ppkd_b4_abee/day33/models/user.dart';

class AuthAPI {
  static Future<RegisterModel> registerUser({
    required String email,
    required String name,
    required String password,
  }) async {
    final url = Uri.parse(Endpoint.register);
    final response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {"name": name, "email": email, "password": password},
    );
    print(response.body);
    print(response.statusCode);
    log(response.body);
    if (response.statusCode == 200) {
      return RegisterModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"]);
    }
  }

  static Future<loginModel.Login> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(Endpoint.login);
    final response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {"email": email, "password": password},
    );
    print(response.body);
    print(response.statusCode);
    log(response.body);
    if (response.statusCode == 200) {
      return loginModel.Login.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"]);
    }
  }

  static Future<loginModel.User> getProfile() async {
    final String? token = await PreferenceHandler.getToken();
    if (token == null) {
      throw Exception("Token tidak ditemukan. User belum login.");
    }

    final url = Uri.parse(Endpoint.profile);

    final response = await http.get(
      url,
      headers: {"Authorization": "Bearer $token", "Accept": "application/json"},
    );

    print("PROFILE RESPONSE: ${response.body}");

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      return loginModel.User.fromJson(jsonData["data"]);
    } else {
      throw Exception("Gagal mengambil data profile");
    }
  }

  static Future<loginModel.Login> UpdateProfile({
    required String nama,
    required String token,
  }) async {
    final url = Uri.parse(Endpoint.profile);
    final response = await http.put(
      url,
      headers: {"Authorization": "Bearer $token", "Accept": "application/json"},
      body: {"name": nama},
    );
    print(response.body);
    print(response.statusCode);
    log(response.body);
    if (response.statusCode == 200) {
      return loginModel.Login.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"]);
    }
  }
}
