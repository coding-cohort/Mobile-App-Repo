import 'package:cbt/constants.dart';
import 'package:cbt/screens/goal_entry/goal_entry_screen1.dart';
import 'package:cbt/screens/goal_entry/goal_entry_screen2.dart';
import 'package:cbt/screens/login_screen.dart';
import 'package:cbt/screens/update_account_screen.dart';
import 'package:flutter/material.dart';

class Toolkit extends StatefulWidget {
  @override
  _ToolkitState createState() => _ToolkitState();
}

class _ToolkitState extends State<Toolkit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffEDF4F5),
            Color(0xff369DA4),
          ],
        ),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              'Toolkit',
              style: kStyleTitle,
            ),
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildToolkitItem(
                'assets/images/person.png',
                'Account',
                () {
                  Navigator.of(context)
                      .pushNamed(UpdateAccountScreen.routeName);
                },
              ),
              buildToolkitItem(
                'assets/images/tv.png',
                'Pain reports',
                () {
                  Navigator.of(context).pushNamed(GoalEntryScreen1.routeName);
                },
              ),
              buildToolkitItem(
                'assets/images/walking_person.png',
                'Exercise',
                () {
                  Navigator.of(context).pushNamed(GoalEntryScreen1.routeName);
                },
              ),
            ],
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              buildToolkitItem(
                'assets/images/dart.png',
                'Goals',
                () {
                  Navigator.of(context).pushNamed(GoalEntryScreen1.routeName);
                },
              ),
              SizedBox(width: 50),
              buildToolkitItem(
                'assets/images/emoji.png',
                'Meditation',
                () {
                  Navigator.of(context).pushNamed(GoalEntryScreen2.routeName);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column buildToolkitItem(String iconURL, String title, Function route) {
    return Column(
      children: <Widget>[
        Container(
          width: 55,
          height: 55,
          child: IconButton(
              icon: Image.asset(
                iconURL,
                fit: BoxFit.contain,
              ),
              onPressed: route),
        ),
        Text(title),
      ],
    );
  }
}
