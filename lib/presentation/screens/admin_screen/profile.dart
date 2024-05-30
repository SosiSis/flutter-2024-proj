import 'package:flutter/material.dart';
import 'package:flutter_project/providers/userprovider.dart'; // Correct path to your UserProvider
import 'package:flutter_riverpod/flutter_riverpod.dart';

class adminprofile extends ConsumerWidget {
  const adminprofile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    // Controllers initialized directly with user's current information
    final nameController = TextEditingController(text: user.name);
    final passwordController = TextEditingController(text: user.password);
    final emailController = TextEditingController(text: user.email);

    // Update user profile fields and show a snackbar
    void updateProfile() {
      ref.read(userProvider.notifier).updateUser(
        name: nameController.text,
        password: passwordController.text,
        email: emailController.text,
        id: 'id',
      );
      // Show a snackbar on success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Profile Updated Successfully!'),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[300],
        title: const Center(child: Text('Your Profile', style: TextStyle(color: Colors.white))),
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
