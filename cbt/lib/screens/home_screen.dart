import 'package:cbt/screens/home_content_screen.dart';
import 'package:cbt/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../screens/pain_data_entry_screen.dart';
import '../widgets/toolkit.dart';

User loggedInUser;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    PainDataEntryScreen(),
    Container(decoration: BoxDecoration(gradient: kBackgroundGradient)),
  ];

  final List<BottomNavigationBarItem> _tabs = [
    BottomNavigationBarItem(
      icon: ImageIcon(AssetImage("assets/images/toolkit.png")),
      title: Text('Toolkit'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add),
      title: Text('Track'),
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(AssetImage("assets/images/calm.png")),
      title: Text('calm'),
    ),
  ];

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: avatar,
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            _auth.signOut();
            Navigator.popUntil(
              context,
              ModalRoute.withName(LoginScreen.routeName),
            );
          },
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kAccentColor,
        elevation: 0,
        currentIndex: _selectedIndex,
        items: _tabs,
        onTap: (_selectedIndex) {
          bottomNavAction(context, _selectedIndex);
        },
      ),
    );
  }
}
