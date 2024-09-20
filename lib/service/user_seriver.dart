import 'dart:convert';

import 'package:networking_practice/model/user.dart';
import 'package:http/http.dart'as http;

class UserSeriver{
  static String baseUrl='http://192.168.6.207:3000';
  
  Future<List<User>>usersget() async {
    final response =await  http.get (Uri.parse('$baseUrl/users'));
    if (response.statusCode==200) {
      final json=response.body;
      final map=jsonDecode(json);
      final usersmap=map['user']as List<dynamic>;
      final user= usersmap.map((e) {
        return User.fromJson(e);
      },).toList();
      return user;
    }  else{
      throw Exception('no user data');
    }
  }
  Future<User> changeusers( User user) async {
   final response=await http.post(Uri.parse('$baseUrl/users'),
   body: jsonEncode(user.toJson()),
       headers: {
     "type-content":"appilication/json",
       }
   );
   if (response.statusCode==201) {
     final json= response.body;
     final map=jsonDecode(json);
     final user= User.fromJson(map);
     return user;
   }  else{
     throw Exception('unable to post');
   }
  }
  Future<User> updateUser(User user) async {
    final response=await http.put(Uri.parse('$baseUrl/users{$User.id}'),
    body: jsonEncode(user.toJson()),
      headers: {
      "type-content":" application/json",
      }
    );
    if(response.statusCode==200){
    final json= response.body;
    final map =jsonDecode(json);
    final usermap=map['user'];
    final user=User.fromJson(usermap);
    return user;
    }else{
      throw Exception('no update has been taken');
    }
  }
  Future<String> deleteUser(User user) async {
    final repsonse= await http.delete(Uri.parse('$baseUrl/user{$user.id}'));
    if (repsonse.statusCode==200) {
      final json= repsonse.body;
      final map= jsonDecode(json);
      final messagemap=map['message'];
      return messagemap;
    }  else throw Exception('unable to delete');
  }
  }
