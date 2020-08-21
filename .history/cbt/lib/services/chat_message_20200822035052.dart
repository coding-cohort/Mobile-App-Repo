import 'package:flutter/material.dart';

// // creating a Widget ChatMessage
// class ChatMessage extends StatelessWidget {
//   // creating the properties for text , name and type
//   final String text;
//   final String name;
//   final bool type;

//   // initializing the above properties
//   ChatMessage({
//     this.text,
//     this.name,
//     this.type,
//   });

//   // the below method is created for the bot
//   List<Widget> otherMessage(context) {
//     return <Widget>[
//       Container(
//         margin: EdgeInsets.only(
//           right: 16.0,
//         ),
//         child: CircleAvatar(
//           // TODO 3: need to add the image for the bot
//           child: Image.asset(''),
//         ),
//       ),
//       Expanded(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               this.name,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(
//                 top: 5.0,
//               ),
//               child: Text(
//                 text,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ];
//   }

//   // the below method is created for the user
//   List<Widget> myMessage(context) {
//     return <Widget>[
//       Expanded(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: <Widget>[
//             Text(
//               name,
//               style: Theme.of(context).textTheme.subtitle1,
//             ),
//             Container(
//               margin: EdgeInsets.only(
//                 top: 5.0,
//               ),
//               child: Text(
//                 text,
//               ),
//             ),
//           ],
//         ),
//       ),
//       Container(
//         margin: EdgeInsets.only(
//           left: 16.0,
//         ),
//         child: CircleAvatar(
//           child: Text(
//             this.name[0],
//           ),
//         ),
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(
//         vertical: 10.0,
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: this.type ? myMessage(context) : otherMessage(context),
//       ),
//     );
//   }
// }

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(context) {
    return <Widget>[
      new Container(
        margin: const EdgeInsets.only(right: 16.0),
        child: new CircleAvatar(child: new Text('B')),
      ),
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(this.name,
                style: new TextStyle(fontWeight: FontWeight.bold)),
            new Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: new Text(text),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> myMessage(context) {
    return <Widget>[
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Text(this.name, style: Theme.of(context).textTheme.subtitle1),
            new Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: new Text(text),
            ),
          ],
        ),
      ),
      new Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: new CircleAvatar(
            child: new Text(
          this.name[0],
          style: new TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}
