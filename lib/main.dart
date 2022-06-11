import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'Quizzerbrain.dart';

Quizbrain qb = Quizbrain();
void main() => runApp(quizzler());

class quizzler extends StatefulWidget {
  const quizzler({Key? key}) : super(key: key);

  @override
  State<quizzler> createState() => _quizzlerState();
}

class _quizzlerState extends State<quizzler> {
  List<Icon> scorekeeper = [];

  void compare(bool userans) {
    bool correctans = qb.getans();
    setState(() {
      print(qb.isFinished());
      if (qb.isFinished() == true) {
        Alert(
                context: context,
                title: 'Finished!',
                desc: 'You\'ve reached the end of the quiz.')
            .show();
        qb.reset();
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
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
      ),
    );
  }
} /*
Icon(
Icons.check,
color: Colors.green,
),
Icon(
Icons.close,
color: Colors.red,
),*/
