import 'package:cbt/constants.dart';
import 'package:cbt/screens/pain_data_entry_screen.dart';
import 'package:cbt/widgets/toolkit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class GoalEntryScreen1 extends StatefulWidget {
  static const routeName = '/goal-entry-screen1';
  @override
  _GoalEntryScreen1State createState() => _GoalEntryScreen1State();
}

class _GoalEntryScreen1State extends State<GoalEntryScreen1> {
  final _timesPerWeekFocusNode = FocusNode();
  final _lifeGoalsFocusNode = FocusNode();
  final _relaxationFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool showSpinner = false;

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
      bottomNavigationBar: buildBottomNavigationBar(context),
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
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(gradient: kBackgroundGradient),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 230,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Track your goals',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  buildSignupForm(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: kAccentColor,
      elevation: 0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Toolkit'),
            backgroundColor: Color(0x20000000)),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          title: Text('Track'),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.leaf),
          title: Text('Calm'),
        ),
      ],
      onTap: (_selectedIndex) {
        bottomNavAction(context, _selectedIndex);
      },
    );
  }

  Container buildSignupForm(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 40.0),
      child: Form(
        key: _form,
        child: Column(
          children: <Widget>[
            buildLabel('Exercise'),
            SizedBox(height: 15),
            TextFormField(
              style: kStyleTextBlack,
              decoration: buildInputDecoration(),
              textInputAction: TextInputAction.next,
              controller: nameController,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_lifeGoalsFocusNode);
              },
            ),
            SizedBox(height: 30),
            buildLabel('Life goals'),
            SizedBox(height: 15),
            TextFormField(
              style: kStyleTextBlack,
              decoration: buildInputDecoration(),
              textInputAction: TextInputAction.next,
              focusNode: _lifeGoalsFocusNode,
              controller: surnameController,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_relaxationFocusNode);
              },
            ),
            SizedBox(height: 30),
            buildLabel('Relaxation'),
            SizedBox(height: 15),
            TextFormField(
              style: kStyleTextBlack,
              keyboardType: TextInputType.emailAddress,
              decoration: buildInputDecoration(),
              textInputAction: TextInputAction.next,
              focusNode: _relaxationFocusNode,
              controller: emailController,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_timesPerWeekFocusNode);
              },
            ),
            SizedBox(height: 30),
            buildLabel('Times per week'),
            SizedBox(height: 15),
            TextFormField(
              style: kStyleTextBlack,
              obscureText: true,
              decoration: buildInputDecoration(),
              textInputAction: TextInputAction.done,
              controller: passwordController,
              focusNode: _timesPerWeekFocusNode,
              onFieldSubmitted: (_) {},
            ),
            SizedBox(height: 30),
            RaisedButton(
              shape: kShapeButton,
              padding: EdgeInsets.all(0),
              onPressed: () {},
              child: Container(
                width: 150,
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
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.all(5.0),
      border: buildOutlineInputBorder(Colors.transparent),
      enabledBorder: buildOutlineInputBorder(Colors.transparent),
      focusedBorder: buildOutlineInputBorder(Colors.transparent),
      errorBorder: buildOutlineInputBorder(Colors.red),
    );
  }

  Align buildLabel(String label) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Lato',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: kBorderRadius,
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}
