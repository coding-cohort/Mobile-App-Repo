import 'package:cbt/models/users.dart';
import 'package:cbt/screens/home_screen.dart';
import 'package:cbt/screens/signup_Screen.dart';
import 'package:cbt/widgets/progress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class UpdateAccountScreen extends StatefulWidget {
  static const routeName = '/update-screen';
  @override
  _UpdateAccountScreenState createState() => _UpdateAccountScreenState();
}

class _UpdateAccountScreenState extends State<UpdateAccountScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  UserDetails user;
  final _nameFocusNode = FocusNode();
  final _surnameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  final _surnameController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  bool _isNameValid = true;
  bool _isSurnameValid = true;
  bool _isEmailValid = true;

  bool isReadOnly = true;
  bool isLoading = false;

  @override
  void dispose() {
    _surnameFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  getUser() async {
    setState(() {
      isLoading = true;
    });
    DocumentSnapshot doc = await userRef.doc(auth.currentUser.uid).get();
    user = UserDetails.fromDocument(doc);

    print(auth.currentUser.uid);
    _nameController.text = user.name;
    _emailController.text = user.email;
    print(user.surname);
    _surnameController.text = user.surname;

    setState(() {
      isLoading = false;
    });
  }

  void _updateProfileData() {
    setState(() {
      _nameController.text.trim().length < 3 || _nameController.text.isEmpty
          ? _isNameValid = false
          : _isNameValid = true;

      _surnameController.text.trim().length < 3 ||
              _surnameController.text.isEmpty
          ? _isSurnameValid = false
          : _isSurnameValid = true;

      !_emailController.text.contains('@') || _emailController.text.isEmpty
          ? _isEmailValid = false
          : _isEmailValid = true;
    });

    if (_isNameValid && _isSurnameValid && _isEmailValid) {
      userRef.doc(auth.currentUser.uid).update({
        'name': _nameController.text,
        'surname': _surnameController.text,
        'email': _emailController.text,
      });
      SnackBar snackBar = SnackBar(content: Text('Profile Updated!'));
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
    setState(() {
      isReadOnly = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: avatar,
        centerTitle: true,
      ),
      body: isLoading
          ? circularProgress()
          : Container(
              height: double.infinity,
              decoration: BoxDecoration(gradient: kBackgroundGradient),
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: <Widget>[
                      // avatar,
                      SizedBox(height: 30),
                      buildTextIntro(),
                      buildSignupForm(context),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Align buildTextIntro() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 230,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              'Update your account below',
              style: kStyleTextWhite,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: FlatButton(
                  onPressed: () {
                    setState(() {
                      isReadOnly = !isReadOnly;
                    });
                  },
                  child: Text(
                    'Edit >>',
                    style: kStyleTextWhite,
                  )),
            )
          ],
        ),
      ),
    );
  }

  //

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
              autofocus: true,
              readOnly: isReadOnly,
              controller: _nameController,
              style: kStyleTextBlack,
              decoration: buildInputDecoration(
                  isValid: _isNameValid, text: 'Name too short!'),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_surnameFocusNode);
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please provide your name';
                }
                return null;
              },
              onSaved: (_) {},
            ),
            SizedBox(height: 12),
            buildLabel('Surname'),
            SizedBox(height: 8),
            TextFormField(
              readOnly: isReadOnly,
              controller: _surnameController,
              style: kStyleTextBlack,
              decoration: buildInputDecoration(
                  isValid: _isSurnameValid, text: 'Surname too short!'),
              textInputAction: TextInputAction.next,
              focusNode: _surnameFocusNode,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_emailFocusNode);
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please provide your Surname';
                }
                return null;
              },
              onSaved: (_) {},
            ),
            SizedBox(height: 12),
            buildLabel('Email'),
            SizedBox(height: 8),
            TextFormField(
              readOnly: isReadOnly,
              controller: _emailController,
              style: kStyleTextBlack,
              keyboardType: TextInputType.emailAddress,
              decoration: buildInputDecoration(
                  isValid: _isEmailValid, text: 'Invalid Email format!'),
              textInputAction: TextInputAction.next,
              onSaved: (_) {},
            ),
            SizedBox(height: 12),
            SizedBox(height: 30),
            RaisedButton(
              shape: kShapeButton,
              padding: EdgeInsets.all(0),
              onPressed: _updateProfileData,
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

  InputDecoration buildInputDecoration({bool isValid, String text}) {
    return InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: buildOutlineInputBorder(Colors.transparent),
        enabledBorder: buildOutlineInputBorder(Colors.transparent),
        focusedBorder: buildOutlineInputBorder(Colors.transparent),
        errorBorder: buildOutlineInputBorder(Colors.red),
        errorText: isValid ? null : text);
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
