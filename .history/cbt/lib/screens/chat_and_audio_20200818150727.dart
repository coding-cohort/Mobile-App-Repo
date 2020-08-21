import 'package:flutter/material.dart';

import '../constants.dart';

class ChatAndAudio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(gradient: kBackgroundGradient),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                avatar,
                SizedBox(
                  height: 30,
                ),
                BotTextBubble(
                  content:
                      'data datadata data data data data datadata data data data data datadata data data data data datadata data data data',
                  color: Colors.white,
                  align: Alignment.topLeft,
                ),
                UserTextBubble(),
                Align(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class UserTextBubble extends StatelessWidget {
//   const UserTextBubble({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.topRight,
//       child: Container(
//         margin: EdgeInsets.all(30),
//         padding: EdgeInsets.all(15),
//         decoration: BoxDecoration(
//           gradient: kButtonColor,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Text(
//           'Okay',
//           style: kStyleText,
//         ),
//       ),
//     );
//   }
// }



// class BotTextBubble extends StatelessWidget {
//   final String content;
//   final Color color;
//   final Alignment align;

//   const BotTextBubble({
//     this.content,
//     this.color,
//     this.align,
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: align,
//       child: Container(
//         width: 215,
//         margin: EdgeInsets.symmetric(horizontal: 30),
//         padding: EdgeInsets.all(15),
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Text(
//           content,
//           style: kStyleText,
//         ),
//       ),
//     );
//   }
// }
