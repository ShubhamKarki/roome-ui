import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:roome_ui/ui/shared/customInputField.dart';
import 'package:roome_ui/ui/shared/custom_button.dart';
import 'package:roome_ui/utils/app_constants.dart';
import 'package:roome_ui/utils/colors.dart';
import 'package:roome_ui/utils/styles.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height - AppBar().preferredSize.height - statusBarHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Sign up',
                  style: headingStyle,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomButton(title: 'Facebook', color: fbColor)),
                    SizedBox(width: 15.0),
                    Expanded(
                        child: CustomButton(
                            title: 'Twitter', color: twitterColor)),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                    child: Text(
                  'or sign up with email',
                  style: subtitleStyle,
                )),
                SizedBox(
                  height: 20.0,
                ),
                CustomInputField(
                    hintText: 'First Name',
                    keyboardType: TextInputType.emailAddress,
                    controller: null),
                SizedBox(
                  height: 15.0,
                ),
                CustomInputField(
                    hintText: 'Last Name',
                    keyboardType: TextInputType.emailAddress,
                    controller: null),
                SizedBox(
                  height: 15.0,
                ),
                CustomInputField(
                    hintText: 'Your Email',
                    keyboardType: TextInputType.emailAddress,
                    controller: null),
                SizedBox(
                  height: 15.0,
                ),
                CustomInputField(
                    hintText: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    controller: null),
                SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomButton(
                  title: 'Sign up',
                  ontap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, RoutePaths.HomeScreen, (route) => false);
                  },
                ),
                SizedBox(
                  height: 25.0,
                ),
                Center(
                  child: Text(
                    'By signing up, you agreed with our Terms of \nService and Privacy Policy.',
                    textAlign: TextAlign.center,
                    style: subtitleStyle,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have account?',
                      style: subtitleStyle.copyWith(
                          fontSize: 17, fontFamily: 'Nunito'),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Log in',
                          style: TextStyle(
                            color: primaryColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pop(context);
                            },
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
