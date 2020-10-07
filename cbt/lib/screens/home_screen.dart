import 'package:cbt/screens/audio_screen.dart';
import 'package:cbt/screens/landing_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

import '../constants.dart';
import '../widgets/toolkit.dart';
import '../screens/pain_data_entry_screen.dart';

import 'package:flutter_dialogflow/v2/dialogflow_v2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

User loggedInUser;

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  final _controller = TextEditingController();
  String userName;
  var userData;

  List<Map> responses = [];

  void response(query) async {
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: 'assets/chatbot-wgep-bda1aae8da3f.json')
            .build();
    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse aiResponse = await dialogflow.detectIntent(query);
    setState(() {
      if (query == 'play audio') {
        String audiourl = aiResponse
            .getListMessage()[0]['text']['text'][0]
            .toString()
            .substring(
                0,
                aiResponse
                    .getListMessage()[0]['text']['text'][0]
                    .toString()
                    .length);

        print(audiourl);

        responses.insert(0, {'data': 2, 'url': audiourl});
      } else {
        responses.insert(0, {
          'data': 0,
          'message':
              aiResponse.getListMessage()[0]['text']['text'][0].toString(),
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      // print(user);
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
        print(loggedInUser.uid);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            userData = documentSnapshot.data();
            setState(() {
              userName = userData['name'].toString().toUpperCase();
            });
          }
        });
      }
    } catch (e) {
      print('error $e');
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
    return WillPopScope(
      onWillPop: () =>
          SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
      child: Scaffold(
        appBar: AppBar(
          title: avatar,
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          elevation: 0,
        ),
        drawer: Drawer(
          elevation: 5.0,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                color: Colors.white,
                child: DrawerHeader(
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Debbie',
                          style: TextStyle(fontSize: 30.0),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome, $userName',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  'Settings',
                ),
                onTap: () {
                  // Navigator.of(context).push();
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text(
                  'Sign Out',
                ),
                onTap: () {
                  _auth.signOut();
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    //this will remove all the route stacks and make the landing page the root.
                    Navigator.pushNamedAndRemoveUntil(
                        context,
                        LandingScreen.routeName,
                        (Route<dynamic> route) => false);
                  });
                },
              )
            ],
          ),
        ),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(gradient: kBackgroundGradient),
            child: Column(
              children: <Widget>[
                Flexible(
                  child: ListView.builder(
                    // shrinkWrap: true,
                    reverse: true,
                    itemCount: responses.length,
                    itemBuilder: (context, index) {
                      if (responses[index]['data'] == 0) {
                        return buildBotTextBubble(
                            responses[index]['message'].toString());
                      } else if (responses[index]['data'] == 1) {
                        return buildUserTextBubble(
                            responses[index]['message'].toString());
                      }
                      return buildAudioTextBubble(
                          responses[index]['url'].toString(), context);
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
                          autofocus: false,
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
                                responses.insert(0,
                                    {'data': 1, 'message': _controller.text});
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
              backgroundColor: Color(0x20000000)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.leaf),
              title: Text(''),
            ),
          ],
          onTap: (_selectedIndex) {
            bottomNavAction(context, _selectedIndex);
          },
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

buildAudioTextBubble(String content, BuildContext context) {
  return InkWell(
    focusColor: kAccentColor,
    splashColor: kAccentColor,
    onTap: () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return AudioScreen(
            content: content,
          );
        },
      ));
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
            Text('Click to Play Audio'),
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
