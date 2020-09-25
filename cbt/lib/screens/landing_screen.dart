import 'package:cbt/constants.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
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
              SizedBox(height: 40.0,),
              Text('Debbie',style: kLandingPageTitleTextStyle,),
            ],
          ),
        ),
      ),
    );
  }
}

class LandingPageCircle extends StatelessWidget {
  const LandingPageCircle();

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
      child: Container(
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
    );
  }
}
