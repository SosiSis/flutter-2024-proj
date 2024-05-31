import 'package:flutter/material.dart';
import 'package:flutter_project/providers/authprovider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserDetailsPage extends ConsumerStatefulWidget {
  const UserDetailsPage({Key? key}) : super(key: key);

  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends ConsumerState<UserDetailsPage> {
  bool isEditing = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.watch(authNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
        actions: [
          IconButton(
            icon: Icon(isEditing ? Icons.cancel : Icons.edit),
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: authNotifier.fetchUserDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final user = snapshot.data!;
            print('User data: $user'); // Debugging statement

            // Check for null values and provide default values if necessary
            final userName = user['name'] ?? 'No Name';
            final userEmail = user['email'] ?? 'No Email';
            final userPassword = user['password'] ?? 'No Password';

            nameController.text = userName;
            emailController.text = userEmail;
            passwordController.text = userPassword;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      border: isEditing ? OutlineInputBorder() : InputBorder.none,
                      enabled: isEditing,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: isEditing ? OutlineInputBorder() : InputBorder.none,
                      enabled: isEditing,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: isEditing ? OutlineInputBorder() : InputBorder.none,
                      enabled: isEditing,
                    ),
                  ),
                  SizedBox(height: 16),
                  if (isEditing)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            // Save the changes
                            await authNotifier.updateUserDetails(
                              nameController.text,
                              emailController.text,
                              passwordController.text,
                            );
                            setState(() {
                              isEditing = false;
                            });
                          },
                          child: Text('Save'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isEditing = false;
                            });
                          },
                          child: Text('Cancel'),
                        ),
                      ],
                    ),
                ],
              ),
            );
          } else {
            return Center(child: Text('No user data found.'));
          }
        },
      ),
    );
  }
}
