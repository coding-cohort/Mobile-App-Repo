import 'package:cbt/constants.dart';
import 'package:cbt/screens/pain_data_entry_screen.dart';
import 'package:cbt/widgets/toolkit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoalEntryScreen3 extends StatefulWidget {
  static const routeName = '/goal-entry-screen3';
  @override
  _GoalEntryScreen3State createState() => _GoalEntryScreen3State();
}

class _GoalEntryScreen3State extends State<GoalEntryScreen3> {
  var selectedItems;
  List<Widget> pickerItems;
  int _selectedIndex = 0;
  void bottomNavAction(BuildContext ctx, int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return Toolkit();
        },
      );
    }
    if (_selectedIndex == 1) {
      print(_selectedIndex);
      Navigator.of(context).pushNamed(PainDataEntryScreen.routeName);
    }
    if (_selectedIndex == 2) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kAccentColor,
        elevation: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text(''),
              backgroundColor: Color(0x20000000)),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.leaf),
            title: Text(''),
          ),
        ],
        onTap: (_selectedIndex) {
          bottomNavAction(context, _selectedIndex);
        },
      ),
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
                      'Select period completed',
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
                SizedBox(height: 120),
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
                      'Save',
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
        'Today',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      Text(
        'Yesterday',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      Text(
        'This week',
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
