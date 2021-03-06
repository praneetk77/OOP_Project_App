import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:oop_project_atm/screens/existing_user_screen.dart';
import 'package:oop_project_atm/screens/new_user_screen.dart';
import 'package:oop_project_atm/services/atm_helper.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({required this.atmHelper});
  ATMHelper atmHelper;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        decoration: BoxDecoration(color: Colors.orangeAccent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Are you a new or existing user?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new NewUserScreen(widget.atmHelper),
                  ),
                );
              },
              child: Container(
                width: 100,
                padding: EdgeInsets.all(10),
                child: Text(
                  "NEW",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
                decoration: BoxDecoration(color: Colors.deepOrangeAccent),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) =>
                        new ExistingUserScreen(widget.atmHelper),
                  ),
                );
              },
              child: Container(
                width: 100,
                padding: EdgeInsets.all(10),
                child: Text(
                  "EXISTING",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
                decoration: BoxDecoration(color: Colors.deepOrangeAccent),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  String text;
  Function function;
  CustomButton({required this.text, required this.function});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function(),
      child: Container(
        width: 100,
        padding: EdgeInsets.all(10),
        child: Text(
          this.text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        decoration: BoxDecoration(color: Colors.deepOrangeAccent),
      ),
    );
  }
}
