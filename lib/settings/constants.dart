import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);
const kTextFormFieldDecoration = InputDecoration(
  labelStyle: TextStyle(
    color: Color(0xffA9A9A9),
    fontSize: 16,
  ),
  fillColor: Colors.white,
  enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
    color: Color(0xff4F5558),
  )),
  focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
    color: Colors.grey,
  )),
  hintStyle: TextStyle(
    color: Color(0xff585858),
  ),
);

const kTextFieldInputStyling = TextStyle(
  color: Colors.white,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Escribe un mensaje...',
  hintStyle: TextStyle(color: Colors.white),
  border: InputBorder.none,
  

);

const kMessageDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Color(0xff262C31), width: 2.0),
  ),
  color: Color(0xff333B41),
);
