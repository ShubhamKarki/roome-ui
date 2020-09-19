import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:roome_ui/ui/shared/customInputField.dart';
import 'package:roome_ui/ui/shared/custom_button.dart';
import 'package:roome_ui/utils/app_constants.dart';
import 'package:roome_ui/utils/colors.dart';
import 'package:roome_ui/utils/styles.dart';

class LoginScreen extends StatelessWidget {
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
                  'Log in',
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
                  'or log in with email',
                  style: subtitleStyle,
                )),
                SizedBox(
                  height: 20.0,
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
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot your password?',
                    style: subtitleStyle,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomButton(
                  title: 'Log in',
                  ontap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, RoutePaths.HomeScreen, (route) => false);
                  },
                ),
                Expanded(
                  child: Container(),
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account?',
                      style: subtitleStyle.copyWith(
                          fontSize: 17, fontFamily: 'Nunito'),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Sign up',
                          style: TextStyle(
                            color: primaryColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                  context, RoutePaths.SignupScreen);
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
