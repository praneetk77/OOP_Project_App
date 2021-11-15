import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oop_project_atm/model/user.dart';
import 'package:oop_project_atm/screens/deposit_screen.dart';
import 'package:oop_project_atm/screens/home_screen.dart';
import 'package:oop_project_atm/screens/withdraw_screen.dart';
import 'package:oop_project_atm/services/atm_helper.dart';

class TransactionScreen extends StatefulWidget {
  TransactionScreen({required this.atmHelper, required this.id});
  ATMHelper atmHelper;
  int id;

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
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
              "Welcome user number " +
                  widget.atmHelper.getUser(widget.id).id.toString() +
                  ", your balance is Rs. " +
                  widget.atmHelper.getUser(widget.id).balance.toString() +
                  ".",
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
              "Please select one of the following options.",
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
                  MaterialPageRoute(
                    builder: (context) => DepositScreen(
                        atmHelper: widget.atmHelper, id: widget.id),
                  ),
                );
              },
              child: Container(
                width: 100,
                padding: EdgeInsets.all(10),
                child: Text(
                  "DEPOSIT",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
                decoration: BoxDecoration(color: Colors.deepOrangeAccent),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WithdrawScreen(
                        atmHelper: widget.atmHelper, id: widget.id),
                  ),
                );
              },
              child: Container(
                width: 100,
                padding: EdgeInsets.all(10),
                child: Text(
                  "WITHDRAW",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
                decoration: BoxDecoration(color: Colors.deepOrangeAccent),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        HomeScreen(atmHelper: widget.atmHelper),
                  ),
                );
              },
              child: Container(
                width: 100,
                padding: EdgeInsets.all(10),
                child: Text(
                  "FINISH",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
                decoration: BoxDecoration(color: Colors.deepOrangeAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
