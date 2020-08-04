import 'package:flutter/material.dart';

import '../constants.dart';

class ChatAndAudio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(gradient: kBackgroundGradient),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                avatar,
                SizedBox(
                  height: 30,
                ),
                buildBotTextBubble(
                  'data datadata data data data data datadata data data data data datadata data data data data datadata data data data',
                  Colors.white,
                  Alignment.topLeft,
                ),
                buildUserTextBubble(),
                Align(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Align buildUserTextBubble() {
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

Align buildBotTextBubble(String content, Color color, Alignment align) {
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
