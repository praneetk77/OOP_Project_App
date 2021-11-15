import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewUserScreen extends StatefulWidget {
  NewUserScreen({Key? key}) : super(key: key);
  TextEditingController myController = new TextEditingController();

  @override
  _NewUserScreenState createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<NewUserScreen> {
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
            "Your ID is SAMPLEDATA. Please remember it.",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: widget.myController,
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
                hintText: 'Enter your chosen pin',
                hintStyle: TextStyle(color: Colors.black),
                hoverColor: Colors.red),
          ),
          SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {
              print(widget.myController.text);
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
