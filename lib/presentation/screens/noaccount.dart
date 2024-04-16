import 'package:flutter/material.dart';
import '../../top_bar.dart';

class NoAccount extends StatelessWidget {
  const NoAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PagesAppBar(),
          Image.asset(
            "Assets/keys.jpg",
            height: 300,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              print('Button clicked');
            },
            child: Text('Read More', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
