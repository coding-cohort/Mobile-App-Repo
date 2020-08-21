import 'package:flutter/material.dart';

// creating a Widget ChatMessage
class ChatMessage extends StatelessWidget {
  // creating the properties for text , name and type
  final String text;
  final String name;
  final bool type;

  // initializing the above properties
  ChatMessage({
    this.text,
    this.name,
    this.type,
  });

  // the below method is created for the bot
  List<Widget> otherMessage(context) {
    return <Widget>[
      Container(
        margin: EdgeInsets.only(
          right: 16.0,
        ),
        child: CircleAvatar(
          // TODO 3: need to add the image for the bot
          child: Image.asset(''),
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              this.name,
              style: TextStyle(
                fontWeight: 
              ),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}
