import 'package:cbt/screens/audio_screen.dart';
import 'package:cbt/screens/chat_and_audio.dart';
import 'package:cbt/screens/my_home_page.dart';
import 'package:cbt/screens/pain_data_entry_screen.dart';
import 'package:flutter/material.dart';
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
        // adding the scaffold background color
        scaffoldBackgroundColor: Color(0xFF649CF8),
      ),
      initialRoute: '/', // takes us to the signup screen
      routes: {
        '/': (context) => SignUpScreen(),

        HomePageDialogflow.homePageId: (context) =>
            HomePageDialogflow(), // takes us to the homepage

        AudioScreen.audioScreenId: (context) =>
            AudioScreen(), // takes us to the audio screen

        ChatAndAudio.chatAndAudioScreenId: (context) =>
            ChatAndAudio(), // takes to the Chat and Audio screen

        PainDataEntryScreen.painDataEntry: (context) =>
            PainDataEntryScreen(), // takes to the pain Data entry screen

        
      },
    );
  }
}
