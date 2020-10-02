import 'package:cbt/constants.dart';
import 'package:cbt/screens/home_screen.dart';
import 'package:cbt/screens/login_screen.dart';
import 'package:cbt/screens/signup_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LandingScreen extends StatefulWidget {
  static const routeName = '/landing-screen';
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isUserLoggedIn();
  }

  void isUserLoggedIn() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/landing-image.jpg'),
                fit: BoxFit.fill),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              avatarIcon,
              Text(
                'Help when you \n need it most',
                style: kLandingPageTextstyle,
              ),
              LandingPageCircle(),
              SizedBox(
                height: 40.0,
              ),
              Text(
                'Debbie',
                style: kLandingPageTitleTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LandingPageCircle extends StatelessWidget {
  const LandingPageCircle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25.0),
      height: 220.0,
      width: 220.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0x50D8DCE1),
        border: Border.all(color: Colors.white, width: 2.0),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(SignUpScreen.routeName);
        },
        child: Container(
          key: Key('buttonContainer'),
          height: 50.0,
          width: 50.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0x50D8DCE1),
            border: Border.all(color: Colors.white, width: 2.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Join us',
                  style: kBubbleTextStyle,
                  key: Key('text'),
                ),
              ),
              Center(
                child: Text(
                  'now',
                  style: kBubbleTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
