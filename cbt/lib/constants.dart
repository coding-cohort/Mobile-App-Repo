import 'package:flutter/material.dart';

// Theme Color
const Color kPrimaryColor = Color(0xff649CF8);
const Color kAccentColor = Color(0xff51F0FA);
const Color kWhite = Colors.white;

// Radius
BorderRadius kBorderRadius = BorderRadius.circular(10);

// Background
const kBackgroundGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xff649CF8),
    Color(0xff51F0FA),
  ],
);

// Button
const kButtonColor = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    // Color(0xffF5F5F6),
    Color(0xffB5B8F3),
    Color.fromARGB(255, 110, 109, 200),
  ],
);
const Color kButtonBorderColor = Color(0xffF5F5F6);

// Toolbar
const kToolbarColor = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xffF8FAFA),
    Color(0xffDEE8E8),
  ],
);

// Text Style
const kStyleTitle = TextStyle(
  fontSize: 24,
  fontFamily: 'Lato',
  // fontWeight: FontWeight.bold,
  color: Colors.black,
);

const kStyleTextBlack = TextStyle(
  fontSize: 16,
  fontFamily: 'Lato',
  color: Colors.black,
  // fontWeight: FontWeight.bold,
);
const kStyleTextWhite = TextStyle(
  fontSize: 16,
  fontFamily: 'Lato',
  color: Colors.white,
  // fontWeight: FontWeight.bold,
);
const kStyleButton = TextStyle(
  fontSize: 16,
  fontFamily: 'Lato',
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

// Button Shape
ShapeBorder kShapeButton = RoundedRectangleBorder(
  borderRadius: kBorderRadius,
  // side: BorderSide(color: kButtonBorderColor),
);

Decoration kButtonDecoration = BoxDecoration(
  gradient: kButtonColor,
  borderRadius: kBorderRadius,
);

// Text Field Decoration
const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: kStyleTextBlack,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kAccentColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kAccentColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

// Avatar Container
Widget avatar = Container(
  height: 50,
  width: 50,
  margin: const EdgeInsets.all(18),
  child: Image.asset('assets/images/female_1.png'),
);

Widget avatarIcon = CircleAvatar(
  backgroundImage: AssetImage('assets/images/female_1.png'),
  backgroundColor: Colors.white,
  radius: 30.0,
);

const kLandingPageTextstyle =
    TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic, color: Colors.white);

const kBubbleTextStyle =
    TextStyle(fontStyle: FontStyle.italic, color: Colors.white, fontSize: 20.0);

const kLandingPageTitleTextStyle = TextStyle(fontSize: 50.0,color: Colors.white,letterSpacing: 2.0);
