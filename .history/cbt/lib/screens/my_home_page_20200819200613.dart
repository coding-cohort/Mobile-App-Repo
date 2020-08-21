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
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  // buiding the text composer
  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(
        color: Theme.of(context).accentColor,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: "Write a message",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 4.0,
              ),
              child: IconButton(
                  icon: Icon(
                    Icons.send,
                  ),
                  onPressed: () => ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
              padding: EdgeInsets.all(8.0),
              reverse: true,
            ),
          ),
          Divider(
            height: 1.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }
}
