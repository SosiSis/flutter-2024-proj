import 'package:flutter/material.dart';
import 'package:flutter_project/providers/authnotifier.dart';
import 'package:flutter_project/providers/authprovider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fullNameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.asset('Assets/component.png',
                  alignment: Alignment.center, fit: BoxFit.fill),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  TextFormField(
                    controller: fullNameController,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.mail),
                    ),
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.push('/login');
                    },
                    child: Text(
                      'I already have an account',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () async {
  final fullName = fullNameController.text.trim();
  final email = emailController.text.trim();
  final password = passwordController.text.trim();

  // Regular expression for email validation
  final emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

  // Check if any fields are empty
  if (fullName.isEmpty || email.isEmpty || password.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("All fields are required!")),
    );
    return; // Exit the function if any field is empty
  }

  // Check if the email is valid
  if (!emailRegex.hasMatch(email)) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Please enter a valid email address")),
    );
    return; // Exit the function if the email is invalid
  }

  // Check if the password length is at least 6 characters
  if (password.length < 6) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Password must be at least 6 characters long")),
    );
    return; // Exit the function if the password is too short
  }

  try {
    // Attempt to sign up using the provided full name, email, and password
    await ref
        .read(authNotifierProvider.notifier)
        .signUp(fullName, email, password);

    // If signUp is successful, retrieve the token to verify storage
    final token = await getToken(); 
    print('Token after signup: $token'); // Debug statement

    // Navigate to the home page only if signup is successful
    context.push('/home'); 
  } catch (e) {
    // If an exception occurs during sign up, print the error
    print("Sign-up failed: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Sign-up failed: $e")),
    );
  }
},
child: Text(
  'Sign Up',
  style: TextStyle(color: Colors.white),
),
                  ),
                ],
              ),
            ),
            Container(
              child: Image.asset('Assets/component1.png', fit: BoxFit.fill),
            ),
          ],
        ),
      ),
    );
  }
}
