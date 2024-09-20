
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/user.dart';

class UserService {
  static const String baseUrl = 'http://192.168.6.207:3000';

   Future<List<User>>getUsers()  async {
    final response = await http.get(Uri.parse('$baseUrl/users'));
    if (response.statusCode==200) {

      final json =response.body;
      final map=jsonDecode(json);
      final usermap=map['users']as List<dynamic>;
      final users = usermap.map((e) {
        return User.fromJson(e);
      },).toList();
      return users;
    }else{
      throw Exception('failed to load user data');
    }
  }

  Future<User> createUser(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      body: jsonEncode(user.toJson()),
      headers: {
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 201) {
      final json = response.body;
      final map = jsonDecode(json);
      final user = User.fromJson(map);
      return user;
    } else {
      throw Exception('fail to create user data');
    }
  }
// Implement methods for update and delete operations similarly
}

