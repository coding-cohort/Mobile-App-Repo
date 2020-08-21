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



  List<Widget> otherMessage(context){
    return <Widget>
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
