import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Are you a new or existing user?",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {},
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
          TextButton(
            onPressed: () {},
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
          ),
        ],
      ),
    );
  }
}
