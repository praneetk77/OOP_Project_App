import 'package:flutter/material.dart';
import 'package:oop_project_atm/screens/existing_user_screen.dart';
import 'package:oop_project_atm/screens/home_screen.dart';
import 'package:oop_project_atm/screens/new_user_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: ExistingUserScreen(),
      ),
    );
  }
}
