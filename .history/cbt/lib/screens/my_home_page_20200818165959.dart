import 'package:cbt/constants.dart';
import 'package:flutter/material.dart';

// code for our homepage
class MyHomePage extends StatelessWidget {
  static const String homePageId = '/MyHomePage';

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Container(
  //       decoration: BoxDecoration(
  //         gradient: kBackgroundGradient,
  //       ),
  //       child: Center(
  //         child: RaisedButton(
  //           shape: kShapeButton,
  //           padding: EdgeInsets.all(0),
  //           onPressed: () {},
  //           child: Container(
  //             decoration: kButtonDecoration,
  //             padding: const EdgeInsets.all(10.0),
  //             child: Text(
  //               'Hello World',
  //               style: kStyleButton,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Colu,
      ),
    );
  }
}
