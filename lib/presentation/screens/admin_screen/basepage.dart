// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/screens/admin_screen/adminfeed.dart';
import 'package:flutter_project/presentation/screens/admin_screen/create_post_page.dart';
import 'package:flutter_project/presentation/screens/admin_screen/profile.dart';

class adminbasescreen extends StatefulWidget {
  @override
  State<adminbasescreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<adminbasescreen> {
  int myindex = 0;
  List<Widget> widgetList = [adminFeed(), adminAddPost(), adminprofile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetList[myindex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          onTap: (index) {
            setState(() {
              myindex = index;
            });
          },
          currentIndex: myindex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'add post'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), label: 'profile')
          ]),
    );
  }
}
