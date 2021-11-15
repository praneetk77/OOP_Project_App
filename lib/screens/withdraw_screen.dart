import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oop_project_atm/screens/transaction_screen.dart';
import 'package:oop_project_atm/services/atm_helper.dart';

class WithdrawScreen extends StatelessWidget {
  WithdrawScreen({required this.atmHelper, required this.id});
  ATMHelper atmHelper;
  int id;
  TextEditingController amountController = new TextEditingController();

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
              "Welcome, user number " + atmHelper.getUser(id).id.toString(),
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
              controller: amountController,
              keyboardType: TextInputType.number,
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
                  hintText: 'Enter the amount.',
                  hintStyle: TextStyle(color: Colors.black),
                  hoverColor: Colors.red),
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                int amount = int.parse(amountController.text);
                if (amount < atmHelper.getUser(id).balance) {
                  if (amount % 100 == 0) {
                    atmHelper.getUser(id).balance -= amount;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Amount withdrawn successfully.",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TransactionScreen(atmHelper: atmHelper, id: id),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Please enter a amount of the denomination of 100.",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                    amountController.clear();
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Your account does not have enough balance to process this transaction.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                  amountController.clear();
                }
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
          ],
        ),
      ),
    );
  }
}
