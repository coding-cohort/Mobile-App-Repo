import 'package:flutter/material.dart';

import '../constants.dart';
import '../screens/audio_screen.dart';

class ChatAndAudio extends StatelessWidget {
  static const routeName = '/chat-and-audio';
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
                ),
                buildUserTextBubble(),
                buildAudioTextBubble(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildAudioTextBubble(BuildContext context) {
    return InkWell(
      focusColor: kAccentColor,
      splashColor: kAccentColor,
      onTap: () {
        Navigator.of(context).pushNamed(AudioScreen.routeName);
      },
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(horizontal: 15),
          margin: EdgeInsets.all(30),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Playing ---'),
              SizedBox(
                width: 70,
              ),
              IconButton(
                icon: Image.asset('assets/images/speaker.png'),
                onPressed: () {},
              )
            ],
          ),
        ),
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

buildBotTextBubble(String content, Color color, Alignment align) {
  return Align(
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
  );
}
