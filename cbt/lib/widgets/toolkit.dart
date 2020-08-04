import 'package:cbt/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../screens/update_account_screen.dart';

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
              ),
              buildToolkitItem(
                'assets/images/tv.png',
                'Pain reports',
              ),
              buildToolkitItem(
                'assets/images/walking_person.png',
                'Exercise',
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
              ),
              SizedBox(width: 50),
              buildToolkitItem(
                'assets/images/emoji.png',
                'Meditation',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column buildToolkitItem(String iconURL, String title) {
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
            onPressed: () {
              Navigator.of(context).pushNamed(UpdateAccountScreen.routeName);
            },
          ),
        ),
        Text(title),
      ],
    );
  }
}
