import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

import '../constants.dart';
import '../screens/audio_screen.dart';
import 'package:flutter_dialogflow/v2/dialogflow_v2.dart';

class ChatAndAudio extends StatefulWidget {
  static const routeName = '/chat-and-audio';

  @override
  _ChatAndAudioState createState() => _ChatAndAudioState();
}

class _ChatAndAudioState extends State<ChatAndAudio> {
  final _controller = TextEditingController();
  List<Map> responses = [];

  void response(query) async {
    print('in response');
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
      print(responses);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: avatar,
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: kBackgroundGradient),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
                child: ListView.builder(
              reverse: true,
              itemCount: responses.length,
              itemBuilder: (context, index) {
                return responses[index]['data'] == 0
                    ? Text(responses[index]['message'].toString())
                    : Text(
                        responses[index]['message'].toString(),
                        textAlign: TextAlign.right,
                      );
              },
            )),
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

  buildAudioTextBubble(BuildContext context) {
    return InkWell(
      focusColor: kAccentColor,
      splashColor: kAccentColor,
      onTap: () {
        Navigator.of(context).pushNamed(AudioScreen.routeName);
      },
      child: Align(
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
    );
  }
}

buildUserTextBubble() {
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

buildBotTextBubble(String content, Color color, Alignment align) {
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
