import 'package:flutter/material.dart';

class AppConstants {
  // static const Color myPrimaryColor = Color(0xff30a539);
  static const double defaultAppBarHeight = 0.24;
  static const double defaultPadding = 16;

  static const Color primaryColor = Color(0xffBAE162);
  // static const Color primaryTextColor = Color(0xAf6FF862);
  static const Color darkBlue = Color(0xff1E2E3D);
  static const Color darkerBlue = Color(0xff152534);
  static const Color darkestBlue = Color(0xff0C1C2E);

  static const Color light = Colors.white;
  static const Color grey = Colors.grey;
  static const Color dark = Colors.black87;

  static final RegExp emailRegex =
      RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  static final RegExp passwdRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  // static const double defaultAppBarWidth = 200;
  static const googleSvg = "assets/google.svg";
  static const facebookSvg = "assets/facebook.svg";

  static const baseUrl = "http://62.171.137.149:30080/authentication";
}
