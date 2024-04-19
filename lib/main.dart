import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/screens/detailpage.dart';

void main() {
  runApp(
    const MyApp(),
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
