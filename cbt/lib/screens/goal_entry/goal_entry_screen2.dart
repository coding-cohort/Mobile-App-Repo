import 'package:cbt/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoalEntryScreen2 extends StatefulWidget {
  static const routeName = '/goal-entry-screen2';
  @override
  _GoalEntryScreen2State createState() => _GoalEntryScreen2State();
}

class _GoalEntryScreen2State extends State<GoalEntryScreen2> {
  var selectedItems;
  List<Widget> pickerItems;
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
        height: double.infinity,
        decoration: BoxDecoration(gradient: kBackgroundGradient),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 70.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Select goal completed',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontFamily: 'Lato',
                          letterSpacing: 1.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.0,
                ),
                buildMenuContainer(),
                SizedBox(height: 80),
                RaisedButton(
                  shape: kShapeButton,
                  padding: EdgeInsets.all(0),
                  onPressed: () {},
                  child: Container(
                    width: 100,
                    alignment: Alignment.center,
                    decoration: kButtonDecoration,
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Next > >',
                      style: kStyleButton,
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

  Widget buildMenuContainer() {
    pickerItems = [
      Text(
        'Meditation 3 hours',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      Text(
        'Walk 200 steps',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      Text(
        'Work 50%',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ];
    setState(() {
      selectedItems = 1;
    });

    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          top: BorderSide(color: Colors.white),
          bottom: BorderSide(color: Colors.white),
        ),
      ),
      child: CupertinoPicker(
        magnification: 1.1,
        squeeze: 1.1,
        itemExtent: 32.0,
        scrollController: FixedExtentScrollController(initialItem: 1),
        onSelectedItemChanged: (value) {
          setState(() {
            selectedItems = value;
          });

          print(selectedItems);
        },
        children: pickerItems,
      ),
    );
  }
}
