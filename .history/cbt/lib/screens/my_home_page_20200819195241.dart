// import 'package:cbt/constants.dart';
import 'package:cbt/services/chat_message.dart';
import 'package:flutter/material.dart';

// // TODO 2: need to work on the home page of the app
// // code for our homepage
// class MyHomePage extends StatelessWidget {
//   static const String homePageId = '/MyHomePage';

//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     body: Container(
//   //       decoration: BoxDecoration(
//   //         gradient: kBackgroundGradient,
//   //       ),
//   //       child: Center(
//   //         child: RaisedButton(
//   //           shape: kShapeButton,
//   //           padding: EdgeInsets.all(0),
//   //           onPressed: () {},
//   //           child: Container(
//   //             decoration: kButtonDecoration,
//   //             padding: const EdgeInsets.all(10.0),
//   //             child: Text(
//   //               'Hello World',
//   //               style: kStyleButton,
//   //             ),
//   //           ),
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }

class MyHomePage extends StatefulWidget {
  static const String homePageId = '/MyHomePage';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // creating a list for chat messages
  final List<ChatMessage> _message = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemBuilder: ,
              ),
          ),
        ],
      ),
    );
  }
}
