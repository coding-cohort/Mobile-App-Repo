import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/toolkit.dart';
import '../screens/pain_data_entry_screen.dart';
import '../screens/chat_and_audio.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void bottomNavAction(BuildContext ctx, int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return Toolkit();
        },
      );
    }
    if (_selectedIndex == 1) {
      print(_selectedIndex);
      Navigator.of(context).pushNamed(PainDataEntryScreen.routeName);
    }
    if (_selectedIndex == 2) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: avatar,
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(gradient: kBackgroundGradient),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                // avatar,
                SizedBox(height: 30),
                buildBotTextBubble(
                  'data datadata data data data data datadata data data data data datadata data data data data datadata data data data',
                  Colors.white,
                  Alignment.topLeft,
                  context,
                ),
                buildUserTextBubble(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kAccentColor,
        elevation: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pan_tool),
            title: Text(''),
          ),
        ],
        onTap: (_selectedIndex) {
          bottomNavAction(context, _selectedIndex);
        },
      ),
    );
  }
}

buildUserTextBubble() {
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
        style: kStyleTextWhite,
      ),
    ),
  );
}

buildBotTextBubble(
    String content, Color color, Alignment align, BuildContext context) {
  return InkWell(
    focusColor: kAccentColor,
    splashColor: kAccentColor,
    onTap: () {
      Navigator.of(context).pushNamed(ChatAndAudio.routeName);
    },
    child: Align(
      alignment: align,
      child: Container(
        width: 215,
        margin: EdgeInsets.symmetric(horizontal: 30),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          content,
          style: kStyleTextBlack,
        ),
      ),
    ),
  );
}
