import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

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
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.mail),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      'I do not have account',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () {
                        print('Button clicked');
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )),
            Container(child: Image.asset('Assets/component1.png'))
          ],
        ),
      ),
    );
  }
}
