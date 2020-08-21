import 'package:cbt/constants.dart';
import 'package:flutter/material.dart';

// the below widget is for the user text bubble
class UserTextBubble extends StatelessWidget {
  const UserTextBubble({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.all(30),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: kButtonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          'Okay',
          style: kStyleText,
        ),
      ),
    );
  }
}