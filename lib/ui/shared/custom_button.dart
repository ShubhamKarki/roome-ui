import 'package:flutter/material.dart';
import 'package:roome_ui/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final title;
  final ontap;
  final color;

  const CustomButton(
      {Key key, @required this.title, this.ontap, this.color = primaryColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(32.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              spreadRadius: 2.0,
              color: Colors.black12,
              offset: Offset(5, 5),
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
