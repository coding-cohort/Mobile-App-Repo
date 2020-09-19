import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:flutter_dialogflow/v2/dialogflow_v2.dart';

import '../constants.dart';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final _controller = TextEditingController();
  List<Map> responses = [];

  void response(query) async {
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: 'assets/chatbot-wgep-bda1aae8da3f.json')
            .build();
    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse aiResponse = await dialogflow.detectIntent(query);
    setState(() {
      responses.insert(0, {
        'data': 0,
        'message': aiResponse.getListMessage()[0]['text']['text'][0].toString()
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(gradient: kBackgroundGradient),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // avatar,
            // SizedBox(height: 30),
            // buildBotTextBubble(
            //   'data datadata data data data data datadata data data data data datadata data data data data datadata data data data',
            //   Colors.white,
            //   Alignment.topLeft,
            // ),
            // buildUserTextBubble(),
            // buildAudioTextBubble(context),

            Flexible(
              child: ListView.builder(
                // shrinkWrap: true,
                reverse: true,
                itemCount: responses.length,
                itemBuilder: (context, index) {
                  return responses[index]['data'] == 0
                      ? buildBotTextBubble(
                          responses[index]['message'].toString())
                      : buildUserTextBubble(
                          responses[index]['message'].toString());
                },
              ),
            ),
            Divider(
              height: 3.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Send your message'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (_controller.text.isEmpty) {
                          print('empty');
                        } else {
                          setState(() {
                            responses.insert(
                                0, {'data': 1, 'message': _controller.text});
                          });
                          response(_controller.text);
                          _controller.clear();
                        }
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

buildUserTextBubble(String text) {
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
        text,
        style: kStyleTextWhite,
      ),
    ),
  );
}

buildBotTextBubble(String content) {
  return InkWell(
    focusColor: kAccentColor,
    splashColor: kAccentColor,
    // onTap: () {
    //   Navigator.of(context).pushNamed(ChatAndAudio.routeName);
    // },
    child: Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: 215,
        margin: EdgeInsets.symmetric(horizontal: 30),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          content,
          style: kStyleTextBlack,
        ),
      ),
    ),
  );
}
