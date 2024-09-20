import 'package:flutter/material.dart';
import 'package:networking_practice/service/user_service_old.dart';

import '../model/user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late UserService userService;
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    userService = UserService();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    try {
      final usersList = await userService.getUsers();
      setState(() {
        users = usersList;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  // Implement methods for creating, updating, and deleting users

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text(
          'User Profiles',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Card(
            color: Theme.of(context).primaryColor.withOpacity(0.5),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListTile(
              textColor: Colors.white,
              title: Text(user.name),
              subtitle: Text(user.email),
              // Add buttons for update and delete
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show a dialog to create a new user
          Navigator.pop(context);
        },
        child: Transform.rotate(
            angle: 1.5708, child: const Icon(Icons.price_check)),
      ),
    );
  }
}
