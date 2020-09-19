import 'package:flutter/material.dart';
import 'package:roome_ui/ui/shared/custom_button.dart';
import 'package:roome_ui/utils/app_constants.dart';
import 'package:roome_ui/utils/colors.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: new ExactAssetImage('assets/photo5.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(flex: 3, child: Container()),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Icon(Icons.home, color: whiteColor, size: 40),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Roome',
              style: TextStyle(
                fontFamily: 'Berlin',
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Best hotel deals for your holiday',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
              ),
            ),
            Expanded(flex: 10, child: Container()),
            CustomButton(
              title: 'Get Started',
              ontap: () {
                Navigator.pushNamed(context, RoutePaths.LoginScreen);
              },
            ),
            Expanded(flex: 1, child: Container()),
            Text(
              'Already have account? Log in',
              style: TextStyle(
                color: whiteColor,
              ),
            ),
            Expanded(flex: 1, child: Container()),
          ],
        ),
      ),
    );
  }
}
