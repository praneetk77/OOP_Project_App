import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ExistingUserScreen extends StatefulWidget {
  ExistingUserScreen({Key? key}) : super(key: key);
  TextEditingController idController = new TextEditingController();
  TextEditingController pinController = new TextEditingController();

  @override
  _ExistingUserScreenState createState() => _ExistingUserScreenState();
}

class _ExistingUserScreenState extends State<ExistingUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
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
            "Please enter your ID and Pin.",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: widget.idController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.deepOrange),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.deepOrange),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.deepOrange),
                ),
                hintText: 'Enter your ID',
                hintStyle: TextStyle(color: Colors.black),
                hoverColor: Colors.red),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: widget.pinController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.deepOrange),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.deepOrange),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.deepOrange),
                ),
                hintText: 'Enter your pin',
                hintStyle: TextStyle(color: Colors.black),
                hoverColor: Colors.red),
          ),
          SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Wrong pin entered. Try again.",
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
            child: Container(
              width: 100,
              padding: EdgeInsets.all(10),
              child: Text(
                "PROCEED",
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
