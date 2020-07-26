import 'package:flutter/material.dart';

import './constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CBT',
      theme: ThemeData(
        primaryColor: Color(0xff649CF8),
        accentColor: Color(0xff51F0FA),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: kBackgroundColor,
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
