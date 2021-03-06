import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class PainDataEntryScreen extends StatefulWidget {
  static const routeName = '/pain-entry';

  @override
  _PainDataEntryScreenState createState() => _PainDataEntryScreenState();
}

class _PainDataEntryScreenState extends State<PainDataEntryScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  int _counter = 1;
  var data;

  void _incrementCounter() {
    if (_counter < 10) {
      setState(() {
        _counter++;
      });
      print(_counter);
    }
  }

  void _decrementCounter() {
    if (_counter > 1) {
      setState(() {
        _counter--;
      });
      print(_counter);
    }
  }

  Future<bool> checkIfDocExists(id) async {
    try {
      var collectionRef = _firestore
          .collection('pain')
          .doc(_auth.currentUser.uid)
          .collection('userpain');
      var doc = await collectionRef.doc(id).get();
      return doc.exists;
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: avatar,
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          GestureDetector(
              onTap: () => Navigator.of(context).pop(), child: crossButton),
          SizedBox(
            width: 20.0,
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(gradient: kBackgroundGradient),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              // avatar,
              SizedBox(height: 30),
              buildTextIntro(),
              SizedBox(height: 70),
              Container(
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    vertical: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        onPressed: _incrementCounter,
                        child: buildPainControl('+'),
                      ),
                      buildPainControl('$_counter'),
                      FlatButton(
                        onPressed: _decrementCounter,
                        child: buildPainControl('-'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 100),
              RaisedButton(
                shape: kShapeButton,
                padding: EdgeInsets.all(0),
                onPressed: () async {
                  var currentdate = DateTime.now().toIso8601String();
                  String current1 =
                      currentdate.substring(0, currentdate.indexOf('T'));
                  bool docExists = await checkIfDocExists(
                      current1); // here it will send the date as the id
                  if (docExists) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Error"),
                            content: Text('You can save only once per day'),
                            actions: [
                              FlatButton(
                                child: Text("Ok"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        });
                  } else {
                    var currentdate = DateTime.now().toIso8601String();
                    String current1 =
                        currentdate.substring(0, currentdate.indexOf('T'));
                    _firestore
                        .collection('pain')
                        .doc(_auth.currentUser.uid)
                        .collection('userpain')
                        .doc(current1)
                        .set({
                      'pain_level': _counter,
                      'messageTime': DateTime.now().toIso8601String(),
                      'email': _auth.currentUser.email,
                    });
                    Navigator.pop(context);
                    print('pain value saved in db');
                  }
                },
                child: Container(
                  width: 100,
                  decoration: kButtonDecoration,
                  padding: const EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Save',
                    style: kStyleButton,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text buildPainControl(String sign) {
    return Text(
      sign,
      style: TextStyle(
        fontSize: 74,
        color: Colors.white,
        fontWeight: FontWeight.w100,
      ),
    );
  }

  Align buildTextIntro() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.all(30),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
            'To record your pain level, enter a number between 1 and 10. 1 being the lowest and 10 being the highest',
            style: TextStyle(
              color: Colors.white,
              fontSize: 19.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
              wordSpacing: 1.5,
            ),
            textAlign: TextAlign.center),
      ),
    );
  }
}
