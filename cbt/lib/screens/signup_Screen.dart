import 'package:cbt/screens/home_screen.dart';
import 'package:cbt/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_database/firebase_database.dart';

import '../constants.dart';

final _firestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signup-screen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  DatabaseReference databaseReference =
      FirebaseDatabase.instance.reference().child('users');
  final _surnameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool showSpinner = false;

  @override
  void dispose() {
    _surnameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    surnameController.dispose();
    super.dispose();
  }

  void _saveForm() async {
    _auth
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((result) {
      _firestore.collection('users').doc(result.user.uid).set({
        "name": nameController.text,
        "surname": surnameController.text,
        "email": emailController.text,
      }).then((res) {
        setState(() {
          showSpinner = false;
        });

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      });
    }).catchError((err) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    setState(() {
                      showSpinner = false;
                    });
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
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
                        'Managing pain can be tough.\n\n Get help from Debbie - sign up now!',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(LoginScreen.routeName);
                        },
                        child: Container(
                          width: 100,
                          alignment: Alignment.center,
                          decoration: kButtonDecoration,
                          padding: const EdgeInsets.all(7.0),
                          child: Text(
                            'Login',
                            style: kStyleButton,
                          ),
                        ),
                      )
                    ],
                  )
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
            buildLabel('Name'),
            SizedBox(height: 8),
            TextFormField(
              style: kStyleTextBlack,
              decoration: buildInputDecoration(),
              textInputAction: TextInputAction.next,
              controller: nameController,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_surnameFocusNode);
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please provide your name';
                }
                return null;
              },
            ),
            SizedBox(height: 12),
            buildLabel('Surname'),
            SizedBox(height: 8),
            TextFormField(
              style: kStyleTextBlack,
              decoration: buildInputDecoration(),
              textInputAction: TextInputAction.next,
              focusNode: _surnameFocusNode,
              controller: surnameController,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_emailFocusNode);
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please provide your Surname';
                }
                return null;
              },
            ),
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
              controller: passwordController,
              focusNode: _passwordFocusNode,
              onFieldSubmitted: (_) {},
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
                  'Sign up now!',
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
