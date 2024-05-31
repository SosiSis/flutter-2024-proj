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
                      final fullName = fullNameController.text;
                      final email = emailController.text;
                      final password = passwordController.text;

                      try {
                        await ref
                            .read(authNotifierProvider.notifier)
                            .signUp(fullName, email, password);

                        final token = await getToken(); // Retrieve token to verify storage
                        print('Token after signup: $token'); // Debug statement

                        context.go('/user-details'); // Navigate to user details page after signup
                      } catch (e) {
                        print("Sign-up failed: $e");
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
