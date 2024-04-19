import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_project/presentation/screens/create_post_page.dart';

import 'presentation/screens/detailpage.dart';
import 'package:flutter_project/presentation/screens/login.dart';
import './presentation/screens/admin_screen.dart/admin.dart';
=======
import 'package:flutter_project/Admin/comment_admin.dart';
import 'package:flutter_project/presentation/screens/comment_page.dart';
import 'package:flutter_project/presentation/screens/create_post_page.dart';
import 'package:flutter_project/presentation/screens/detailpage.dart';
import 'package:flutter_project/presentation/screens/login.dart';
>>>>>>> origin/main
import 'package:flutter_project/presentation/screens/noaccount.dart';
import 'package:flutter_project/presentation/screens/profile_two.dart';
import 'package:flutter_project/presentation/screens/signup.dart';
import 'package:flutter_project/presentation/screens/withaccount.dart';

void main() {
  runApp(
<<<<<<< HEAD
    MaterialApp(home: AdminPage()),
=======
    const MyApp(),
>>>>>>> origin/main
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // initialRoute: '/',
      // routes: {
      //   '/':(context) => NoAccount(),
      //   // '/account':(context) => withaccount(),
      //   '/login':(context) => LogInPage(),
      //   '/signup':(context) => SignUpPage(),
      //   '/profile':(context) => ProfileTwo(),
      //   '/detail':(context)=>ItemPage(),
      //   '/add':(context)=>LostFoundForm()

      // },
      home: ItemPage(),
    );
  }
}
