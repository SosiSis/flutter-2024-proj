// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_project/models/items_model.dart';
import 'package:flutter_project/presentation/screens/admin_screen/adminDetail.dart';
import 'package:flutter_project/presentation/screens/admin_screen/comment_admin.dart';
import 'package:flutter_project/presentation/screens/admin_screen/create_post_page.dart';
import 'package:flutter_project/presentation/screens/admin_screen/profile.dart';
import 'package:flutter_project/presentation/screens/admin_screen/withaccount.dart';
import 'package:flutter_project/presentation/screens/comment_page.dart';
import 'package:flutter_project/presentation/screens/create_post_page.dart';
import 'package:flutter_project/presentation/screens/login.dart';
import 'package:flutter_project/presentation/screens/noaccount.dart';
import 'package:flutter_project/presentation/screens/profile.dart';
import 'package:flutter_project/presentation/screens/signup.dart';
import 'package:flutter_project/presentation/screens/withaccount.dart';
import 'package:flutter_project/presentation/widgets/nav.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/screens/detailpage.dart';

void main() {
  runApp(ProviderScope(child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: {
          '/noaccount': (context) => NoAccount(),
          '/withaccount': (context) => WithAccount(),
          '/login': (context) => LogInPage(),
          '/signup': (context) => SignUpPage(),
          '/profile': (context) => ProfileTwo(),
          '/add': (context) => LostFoundForm(),
          '/home': (context) => HomeScreen(),
          '/admin_detail':(context) => AdminItemPage(),
          '/admi_comment':(context) => AdminCommentPage(),
          '/admin_addpost':(context) => adminAddPost(),
          '/admin_profile':(context) => adminProfile(),
          '/admin_feed':(context) => adminFeed(),

        },

        onGenerateRoute: ((settings) {
          if (settings.name == '/detail'){
            final Post item = settings.arguments as Post;
            return MaterialPageRoute(
              builder: (context){
                return ItemPage(item: item);
              });
          }

          if (settings.name == '/comment') {
          final postId = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => CommentPage(postId: postId),
          );
        }

          return null;
        }),

        


        home: NoAccount());
  }
}
