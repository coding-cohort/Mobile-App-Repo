import 'package:flutter/material.dart';
import '../constants.dart';

class AudioScreen extends StatelessWidget {
  // static const routeName = '/audio-screen';

  static const String audioScreenId = '/'
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: kBackgroundGradient),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              avatar, // Avatar Icon Container defined in const file
              Image.asset('assets/images/sound_player.png'),
              audioContainer(),
            ],
          ),
        ),
      ),
    );
  }

  Container audioContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(50),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '-- About CBT -- playing ---',
            style: kStyleText,
          ),
          IconButton(
            icon: Image.asset('assets/images/speaker.png'),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
