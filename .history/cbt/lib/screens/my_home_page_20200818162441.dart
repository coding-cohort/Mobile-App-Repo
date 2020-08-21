import 'package:cbt/constants.dart';
import 'package:flutter/material.dart';

// code fo r
class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: kBackgroundGradient,
        ),
        child: Center(
          child: RaisedButton(
            shape: kShapeButton,
            padding: EdgeInsets.all(0),
            onPressed: () {},
            child: Container(
              decoration: kButtonDecoration,
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Hello World',
                style: kStyleButton,
              ),
            ),
          ),
        ),
      ),
    );
  }
}