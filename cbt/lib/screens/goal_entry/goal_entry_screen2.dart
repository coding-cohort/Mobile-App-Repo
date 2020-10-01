import 'package:cbt/constants.dart';
import 'package:flutter/material.dart';

class GoalEntryScreen2 extends StatefulWidget {
  static const routeName = '/goal-entry-screen2';
  @override
  _GoalEntryScreen2State createState() => _GoalEntryScreen2State();
}

class _GoalEntryScreen2State extends State<GoalEntryScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: avatar,
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          GestureDetector(
              onTap: () => Navigator.of(context).pop(), child: crossButton),
          SizedBox(
            width: 20.0,
          )
        ],
      ),
    );
  }
}
