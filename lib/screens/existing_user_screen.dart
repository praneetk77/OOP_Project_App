import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oop_project_atm/screens/home_screen.dart';
import 'package:oop_project_atm/screens/transaction_screen.dart';
import 'package:oop_project_atm/services/atm_helper.dart';

class ExistingUserScreen extends StatefulWidget {
  ATMHelper atmHelper;
  ExistingUserScreen(this.atmHelper);
  TextEditingController idController = new TextEditingController();
  TextEditingController pinController = new TextEditingController();

  @override
  _ExistingUserScreenState createState() => _ExistingUserScreenState();
}

class _ExistingUserScreenState extends State<ExistingUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
              "Please enter your ID and Pin.",
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
              keyboardType: TextInputType.number,
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
              height: 15,
            ),
            TextField(
              keyboardType: TextInputType.number,
              maxLength: 4,
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
                int id = int.parse(widget.idController.text);
                int pin = int.parse(widget.pinController.text);
                if (widget.atmHelper.authenticate(id, pin)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TransactionScreen(
                            atmHelper: widget.atmHelper, id: id)),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Wrong pin entered. Try again.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                  widget.pinController.clear();
                }
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
            // CustomButton(
            //     text: "PROCEED",
            //     function: () {
            //       int id = int.parse(widget.idController.text);
            //       int pin = int.parse(widget.pinController.text);
            //       if (widget.atmHelper.authenticate(id, pin)) {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => TransactionScreen(
            //                   atmHelper: widget.atmHelper, id: id)),
            //         );
            //       } else {
            //         ScaffoldMessenger.of(context).showSnackBar(
            //           SnackBar(
            //             content: Text(
            //               "Wrong pin entered. Try again.",
            //               textAlign: TextAlign.center,
            //             ),
            //           ),
            //         );
            //       }
            //     }),
          ],
        ),
      ),
    );
  }
}
