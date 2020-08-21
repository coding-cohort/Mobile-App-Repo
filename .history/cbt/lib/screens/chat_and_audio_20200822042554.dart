import 'package:cbt/widgets/bot_text_bubble.dart';
import 'package:cbt/widgets/user_text_bubble.dart';
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
                BotTextBubble(
                  content:
                      'data datadata data data data data datadata data data data data datadata data data data data datadata data data data',
                  color: Colors.white,
                  align: Alignment.topLeft,
                ),
                UserTextBubble(),
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
