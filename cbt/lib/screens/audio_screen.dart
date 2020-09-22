import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

AudioPlayer audioPlayer = AudioPlayer();

class AudioScreen extends StatefulWidget {
  static const routeName = '/audio-screen';
  final String content;

  const AudioScreen({this.content});

  @override
  _AudioScreenState createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playAudio();
  }

  Future playAudio() async {
    return await audioPlayer.play(widget.content, isLocal: false);
  }

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
              await audioPlayer.play(widget.content, isLocal: false);
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
