import 'package:flutter/material.dart';
import 'package:roome_ui/utils/colors.dart';

class CustomInputField extends StatelessWidget {
  final hintText;
  final controller;
  final keyboardType;

  const CustomInputField({
    Key key,
    @required this.hintText,
    @required this.controller,
    this.keyboardType,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(32.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            spreadRadius: 5.0,
            color: chipBackground,
            offset: Offset(5, 5),
          )
        ],
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.black,
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: new InputDecoration(
            hintText: hintText ?? 'Your hint',
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding:
                EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
            hintStyle: TextStyle(
              color: Colors.black45,
            )),
      ),
    );
  }
}
