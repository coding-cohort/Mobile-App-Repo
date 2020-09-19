import 'package:flutter/material.dart';

import '../constants.dart';

class PainDataEntryScreen extends StatefulWidget {
  static const routeName = '/pain-entry';

  @override
  _PainDataEntryScreenState createState() => _PainDataEntryScreenState();
}

class _PainDataEntryScreenState extends State<PainDataEntryScreen> {
  int _counter = 0;

  void _incrementCounter() {
    if (_counter < 5) {
      setState(() {
        _counter++;
      });
    }
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: kBackgroundGradient),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(height: 25),
              buildTextIntro(),
              SizedBox(height: 25),
              Container(
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    vertical: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
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
              SizedBox(height: 50),
              RaisedButton(
                shape: kShapeButton,
                padding: EdgeInsets.all(0),
                onPressed: () {
                  Navigator.pop(context);
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
        fontSize: 64,
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
          'data datadata data data dataa datadata data data data jdkj dklfh kdhf\ndata datadata data data data data datadata data data data',
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
