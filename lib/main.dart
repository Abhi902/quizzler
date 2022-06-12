import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'Quizzerbrain.dart';

Quizbrain qb = Quizbrain();
void main() {
  runApp(
    MaterialApp(
      home: quizzler(),
    ),
  );
}

class quizzler extends StatefulWidget {
  const quizzler({Key? key}) : super(key: key);

  @override
  State<quizzler> createState() => _quizzlerState();
}

class _quizzlerState extends State<quizzler> {
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("quiz over my man!"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  List<Icon> scorekeeper = [];

  void compare(bool userans) {
    bool correctans = qb.getans();
    setState(() {
      print(qb.isFinished());
      if (qb.isFinished() == true) {
        showAlertDialog(context);
        scorekeeper = [];
      } else {
        if (correctans == userans) {
          scorekeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
              size: 15,
            ),
          );
        } else {
          scorekeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
              size: 15,
            ),
          );
        }
      }

      qb.check();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(child: Text("QUIZZLER")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  qb.getQuestionText(),
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  compare(true);
                },
                child: Text(
                  "TRUE",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                onPressed: () {
                  compare(false);
                },
                child: Text(
                  "FALSE",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: scorekeeper,
          ),
        ],
      ),
    );
  }
}
