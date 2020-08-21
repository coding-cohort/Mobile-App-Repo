import 'package:cbt/screens/audio_screen.dart';
import 'package:cbt/screens/chat_and_audio.dart';
import 'package:cbt/screens/my_home_page.dart';
import 'package:flutter/material.dart';
// import './constants.dart';
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

        // adding the scaffold background color
        scaffoldBackgroundColor: Color(0xFF649CF8),
      ),
      // home: SignUpScreen(),
      // making routes for different pages
      initialRoute: '/', // takes us to the signup screen
      routes: {
        // '/': (context) => SignUpScreen(),

        '/': (context) => PainData,

        HomePageDialogflow.homePageId: (context) =>
            HomePageDialogflow(), // takes us to the homepage

        AudioScreen.audioScreenId: (context) =>
            AudioScreen(), // takes us to the audio screen
      },
    );
  }
}

// class MyHomePage extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: kBackgroundGradient,
//         ),
//         child: Center(
//           child: RaisedButton(
//             shape: kShapeButton,
//             padding: EdgeInsets.all(0),
//             onPressed: () {},
//             child: Container(
//               decoration: kButtonDecoration,
//               padding: const EdgeInsets.all(10.0),
//               child: Text(
//                 'Hello World',
//                 style: kStyleButton,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
