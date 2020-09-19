import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

AudioPlayer audioPlayer = AudioPlayer();

class AudioScreen extends StatelessWidget {
  static const routeName = '/audio-screen';
  final String content;

  const AudioScreen({this.content});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: avatar,
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
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

  audioContainer() {
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
          GestureDetector(
            onTap: () async {
              await audioPlayer.play(content, isLocal: false);
            },
            child: Icon(Icons.play_arrow),
          ),
          GestureDetector(
            onTap: () async {
              await audioPlayer.pause();
            },
            child: Icon(Icons.pause),
          ),
          Text(
            '-- About CBT -- playing ---',
            style: kStyleTextBlack,
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
