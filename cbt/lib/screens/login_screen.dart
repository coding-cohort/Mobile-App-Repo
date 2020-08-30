import 'package:cbt/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../constants.dart';

final _firestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();

  String email;
  String password;
  bool showSpinner = false;

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _saveForm() async {
    _auth
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((result) {
      setState(() {
        showSpinner = false;
      });
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return HomeScreen();
        },
      ));
    }).catchError((err) {
      print(err.message);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Username or Password is Incorrect'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      showSpinner = false;
                    });
                  },
                  child: Text('Ok'))
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(gradient: kBackgroundGradient),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  avatar,
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 230,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Managing pain can be tough.\n\n Get help from Debbie - Login below!',
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

  Container buildSignupForm(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      child: Form(
        key: _form,
        child: Column(
          children: <Widget>[
            SizedBox(height: 12),
            buildLabel('Email'),
            SizedBox(height: 8),
            TextFormField(
              style: kStyleTextBlack,
              keyboardType: TextInputType.emailAddress,
              decoration: buildInputDecoration(),
              textInputAction: TextInputAction.next,
              focusNode: _emailFocusNode,
              controller: emailController,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_passwordFocusNode);
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please provide your email';
                }
                if (!value.contains('@')) {
                  return 'Please type a correct email';
                }
                return null;
              },
            ),
            SizedBox(height: 12),
            buildLabel('Password'),
            SizedBox(height: 8),
            TextFormField(
              style: kStyleTextBlack,
              obscureText: true,
              decoration: buildInputDecoration(),
              textInputAction: TextInputAction.done,
              focusNode: _passwordFocusNode,
              onFieldSubmitted: (_) {},
              controller: passwordController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please provide your password';
                }
                if (value.length <= 8) {
                  return 'Password should be at least 8 characters!';
                }
                return null;
              },
            ),
            SizedBox(height: 30),
            RaisedButton(
              shape: kShapeButton,
              padding: EdgeInsets.all(0),
              onPressed: () {
                if (_form.currentState.validate()) {
                  setState(() {
                    showSpinner = true;
                  });
                  _saveForm();
                }
              },
              child: Container(
                width: 150,
                alignment: Alignment.center,
                decoration: kButtonDecoration,
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Login',
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
