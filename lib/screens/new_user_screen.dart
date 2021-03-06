import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oop_project_atm/model/user.dart';
import 'package:oop_project_atm/screens/transaction_screen.dart';
import 'package:oop_project_atm/services/atm_helper.dart';

import 'home_screen.dart';

class NewUserScreen extends StatefulWidget {
  ATMHelper atmHelper;
  NewUserScreen(this.atmHelper);
  TextEditingController myController = new TextEditingController();

  @override
  _NewUserScreenState createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<NewUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Your ID is " +
                  widget.atmHelper.getId().toString() +
                  ". Please remember it.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              maxLength: 4,
              keyboardType: TextInputType.number,
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
            // CustomButton(
            //     text: "PROCEED",
            //     function: () {
            //       int id = widget.atmHelper.getId();
            //       User user = new User(
            //           id: id,
            //           balance: 0,
            //           pin: int.parse(widget.myController.text));
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => TransactionScreen(
            //                 atmHelper: widget.atmHelper, id: id)),
            //       );
            //     }),
            TextButton(
              onPressed: () {
                int id = widget.atmHelper.getId();
                User user = new User(
                    id: id,
                    balance: 0,
                    pin: int.parse(widget.myController.text));
                widget.atmHelper.addUser(user);
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new TransactionScreen(
                        atmHelper: widget.atmHelper, id: id),
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
            )
          ],
        ),
      ),
    );
  }
}
