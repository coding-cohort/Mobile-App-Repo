import 'package:cbt/constants.dart';
import 'package:flutter/material.dart';

// the widget below is for the text bubble for the bot
class BotTextBubble extends StatelessWidget {
  final String content;
  final Color color;
  final Alignment align;

  const BotTextBubble({
    this.content,
    this.color,
    this.align,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          style: kStyleText,
        ),
      ),
    );
  }
}
