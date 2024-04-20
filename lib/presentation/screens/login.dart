// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.asset('Assets/component.png',
                  alignment: Alignment.center, fit: BoxFit.fill

                  // Set width to occupy full width
                  ),
            ),
            Container(
                margin: EdgeInsets.all(20.0),
                // width: 500,
                child: Column(
                  children: [
                    Text("Log In",
                        style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    TextFormField(
                      
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.mail),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                      'I do not have account',
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
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )),
            Container(child: Image.asset('Assets/component1.png',fit: BoxFit.fill,))
          ],
        ),
      ),
    );
  }
}
