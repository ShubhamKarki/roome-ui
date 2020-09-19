import 'package:flutter/material.dart';
import 'package:roome_ui/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final title;
  final ontap;

  const CustomButton({Key key, @required this.title, this.ontap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 42.0,
        margin: EdgeInsets.symmetric(horizontal: 30.0),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(32.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 1.0,
              spreadRadius: 1.0,
              color: Colors.black38,
              offset: Offset(2, 2),
            )
          ],
        ),
        child: Center(
          child: Text(
            title ?? '',
            style: TextStyle(color: whiteColor, fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
