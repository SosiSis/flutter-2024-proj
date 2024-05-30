import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'http://localhost:3003/users';  // Ensure this is your correct base URL

class User {
  final String name;
  final String email;
  final String password;
  final String id;

  User({required this.name, required this.email, required this.password, required this.id});

  static User fromJson(Map<String, dynamic> json) {
    return User(
      name: json['fullname'],  // Adjust the field name if necessary
      email: json['email'],
      password: json['password'], 
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullname': name,  // Adjust the field name if necessary
      'email': email,
      'password': password,
    };
  }
}

class UserNotifier extends StateNotifier<User> {
  UserNotifier(User state) : super(state);

  Future<void> updateUser({required String name, required String email, required String password, required String id}) async {
    final url = Uri.parse('$baseUrl/$id');

    try {
      final response = await http.put(
        url,
        body: jsonEncode({
          'fullname': name,  // Adjust the field name if necessary
          'email': email,
          'password': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        state = User.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to update user: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to update user: $e');
    }
  }
}

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  // Initialize the user with some default data or from some repository
  return UserNotifier(User(name: '', email: '', password: '', id: ''));
});

class ProfileTwo extends ConsumerStatefulWidget {
  const ProfileTwo({Key? key}) : super(key: key);

  @override
  _ProfileTwoState createState() => _ProfileTwoState();
}

class _ProfileTwoState extends ConsumerState<ProfileTwo> {
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    final user = ref.read(userProvider);
    nameController = TextEditingController(text: user.name);
    passwordController = TextEditingController(text: user.password);
    emailController = TextEditingController(text: user.email);
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void updateProfile() {
    final user = ref.read(userProvider);
    ref.read(userProvider.notifier).updateUser(
      name: nameController.text,
      password: passwordController.text,
      email: emailController.text,
      id: user.id, // Ensure the correct ID is passed
    ).then((_) {
      // Show a snackbar on success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Profile Updated Successfully!'),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }).catchError((error) {
      // Handle error, show a snackbar or dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update profile: $error'),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[300],
        title: const Center(child: Text('Your Profileeeee', style: TextStyle(color: Colors.white))),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 100.0, child: Icon(Icons.account_circle, size: 200)),
            const Divider(height: 60, color: Colors.black),
            buildProfileField("Name", nameController),
            buildProfileField("Password", passwordController),
            buildProfileField("Email", emailController),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: updateProfile,
              child: Text("Update Profile"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue[400],
                textStyle: TextStyle(fontSize: 16)
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfileField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.edit),
        ),
      ),
    );
  }
}
