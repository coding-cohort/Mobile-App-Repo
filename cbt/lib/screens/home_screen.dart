import 'package:cbt/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

import '../constants.dart';
import '../widgets/toolkit.dart';
import '../screens/pain_data_entry_screen.dart';
import '../screens/chat_and_audio.dart';
import 'package:flutter_dialogflow/v2/dialogflow_v2.dart';
import 'package:bubble/bubble.dart';

User loggedInUser;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
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
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  int _selectedIndex = 0;

  void bottomNavAction(BuildContext ctx, int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return Toolkit();
        },
      );
    }
    if (_selectedIndex == 1) {
      print(_selectedIndex);
      Navigator.of(context).pushNamed(PainDataEntryScreen.routeName);
    }
    if (_selectedIndex == 2) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: avatar,
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              _auth.signOut();
              Navigator.popUntil(
                  context, ModalRoute.withName(LoginScreen.routeName));
            }),
      ),
      body: SafeArea(
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kAccentColor,
        elevation: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pan_tool),
            title: Text(''),
          ),
        ],
        onTap: (_selectedIndex) {
          bottomNavAction(context, _selectedIndex);
        },
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
