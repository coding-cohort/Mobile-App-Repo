import 'package:flutter/material.dart';

import './constants.dart';
// import './screens/audio_screen.dart';
// import './screens/chat_and_audio.dart';
// import './screens/pain_data_entry_screen.dart';
import './screens/signup_Screen.dart';

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
      // home: SignUpScreen(),
      initialRoute: '/',
      toutes
    );
  }
}

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
