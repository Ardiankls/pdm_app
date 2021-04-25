import 'package:flutter/material.dart';
import 'package:pdm_app/ui/pages/pages.dart';
import 'package:pdm_app/shared/shared.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.mainTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        Login.routeName: (context) => Login(),
        Signup.routeName: (context) => Signup(),
        Home.routeName: (context) => Home(),
        Profile.routeName: (context) => Profile(),
      },
    );
  }
}
