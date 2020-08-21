import 'package:flutter/material.dart';

import '../constants.dart';

class PainDataEntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: kBackgroundGradient),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              avatar,
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
                        onPressed: () {},
                        child: PainEntryControl(
                          text: '+',
                        ),
                      ),
                      Text(
                        '1',
                        style: TextStyle(
                          fontSize: 74,
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: PainEntryControl(
                          text: '-',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 100),
              RaisedButton(
                shape: kShapeButton,
                padding: EdgeInsets.all(0),
                onPressed: () {},
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

// class PainEntryControl extends StatelessWidget {
//   final String text;
//   const PainEntryControl({
//     this.text,
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style: TextStyle(
//         fontSize: 74,
//         color: Colors.white,
//         fontWeight: FontWeight.w100,
//       ),
//     );
//   }
// }
