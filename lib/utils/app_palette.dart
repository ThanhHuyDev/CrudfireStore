import 'package:crudfirestore/utils/hex_color.dart';
import 'package:crudfirestore/utils/sizeconfig.dart';
import 'package:flutter/material.dart';

const kPrimaryGradientLeftToRightColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFBC7BE4), Color(0xFFFF7643)],
);
const kPrimaryGradientRightToLeftColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFF7643), Color(0xFFBC7BE4)],
);
const kPrimaryGradientRightToLeftColorUser = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Colors.deepPurple, Color.fromARGB(255, 235, 156, 218)],
);
const kPrimaryGradientTopToBotColor = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color(0xFFBC7BE4), Color.fromARGB(255, 221, 140, 110)],
);
// gradient
const Color yellow_one = Color(0xFFeec365);
const Color yellow_two = Color(0xFFde9024);
const Color primary_one = Color(0xFFfc3973);
const Color primary_two = Color(0xFFfd5f60);
final formFirstNameInputdecoration = InputDecoration(
  enabledBorder: outlineInputBorder1(),
  focusedBorder: outlineInputBorder1(),
  border: outlineInputBorder1(),
  labelText: "First Name",
  hintText: 'David',
  hintStyle: TextStyle(fontSize: getsizeHeight(16)),
  floatingLabelBehavior: FloatingLabelBehavior.always,
  contentPadding: EdgeInsets.symmetric(
      horizontal: getsizeWidth(20), vertical: getsizeHeight(17)),
  labelStyle: TextStyle(fontSize: getsizeHeight(17)),
);

final formLastNameInputdecoration = InputDecoration(
  enabledBorder: outlineInputBorder1(),
  focusedBorder: outlineInputBorder1(),
  border: outlineInputBorder1(),
  labelText: "Last Name",
  hintText: 'Peterson',
  hintStyle: TextStyle(fontSize: getsizeHeight(16)),
  floatingLabelBehavior: FloatingLabelBehavior.always,
  contentPadding: EdgeInsets.symmetric(
      horizontal: getsizeWidth(20), vertical: getsizeHeight(17)),
  labelStyle: TextStyle(fontSize: getsizeHeight(17)),
);
final formEmailInputdecoration = InputDecoration(
  enabledBorder: outlineInputBorder1(),
  focusedBorder: outlineInputBorder1(),
  border: outlineInputBorder1(),
  labelText: "Email",
  hintText: 'Peterson@gmail.com',
  hintStyle: TextStyle(fontSize: getsizeHeight(16)),
  floatingLabelBehavior: FloatingLabelBehavior.always,
  contentPadding: EdgeInsets.symmetric(
      horizontal: getsizeWidth(20), vertical: getsizeHeight(17)),
  labelStyle: TextStyle(fontSize: getsizeHeight(17)),
);
final formBioInputdecoration = InputDecoration(
  enabledBorder: outlineInputBorder1(),
  focusedBorder: outlineInputBorder1(),
  border: outlineInputBorder1(),
  labelText: "Bio",
  hintText: 'Bio by name',
  hintStyle: TextStyle(fontSize: getsizeHeight(16)),
  floatingLabelBehavior: FloatingLabelBehavior.always,
  contentPadding: EdgeInsets.symmetric(
      horizontal: getsizeWidth(20), vertical: getsizeHeight(17)),
  labelStyle: TextStyle(fontSize: getsizeHeight(17)),
);
final formBirthdayInputdecoration = InputDecoration(
  enabledBorder: outlineInputBorder1(),
  focusedBorder: outlineInputBorder1(),
  border: outlineInputBorder1(),
  hintText: 'Birth of day',
  hintStyle: TextStyle(fontSize: getsizeHeight(16)),
  contentPadding: EdgeInsets.symmetric(
      horizontal: getsizeWidth(70), vertical: getsizeHeight(17)),
  labelStyle: TextStyle(fontSize: getsizeHeight(17)),
);

OutlineInputBorder outlineInputBorder1() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.black38));
}

final otpInputdecoration = InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 15),
    enabledBorder: outlineInputBorder(),
    focusedBorder: outlineInputBorder(),
    border: outlineInputBorder());

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black));
}

class AppPalette {
  AppPalette._();
  static const fontName = 'Muli';
  static const Color primaryBlueColor = Color(0xFF8F94FB);
  static const Color primaryBlueDart = Color.fromARGB(255, 75, 84, 250);
  static final themeData = {
    AppTheme.lightBlueTheme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[100],
        primarySwatch: Colors.blue,
        backgroundColor: Colors.grey[100],
        primaryColor: primaryBlueDart,
        primaryColorDark: primaryBlueDart,
        primaryColorLight: primaryBlueColor,
        cardColor: Colors.white,
        shadowColor: HexColor('#ebf5ed'),
        fontFamily: fontName,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
            letterSpacing: 0.27,
            color: Color(0xFF0C233C),
          ),
          headline2: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            letterSpacing: 0.26,
            color: Color(0xFF0C233C),
          ),
          subtitle1: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15.0,
            letterSpacing: -0.04,
            color: Color.fromRGBO(0, 0, 0, 0.87),
          ),
          subtitle2: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13.0,
            letterSpacing: -0.04,
            color: Color.fromRGBO(0, 0, 0, 0.87),
          ),
          bodyText1: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 13.0,
            color: Color(0xff646464),
          ),
          bodyText2: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 11.0,
            color: Color(0xff646464),
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(
                secondary: HexColor('#FBA308'),
                secondaryVariant: HexColor('#fcb539'),
                primary: primaryBlueDart,
                primaryVariant: primaryBlueColor)),
    AppTheme.dartBlueTheme: ThemeData(
      scaffoldBackgroundColor: HexColor('#222736'),
      primarySwatch: Colors.blue,
      backgroundColor: HexColor('#222736'),
      primaryColor: primaryBlueDart,
      primaryColorDark: primaryBlueDart,
      primaryColorLight: primaryBlueColor,
      cardColor: HexColor('#2a3042'),
      shadowColor: HexColor('#12263f'),
      fontFamily: fontName,
      textTheme: TextTheme(
        headline1: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
          letterSpacing: 0.27,
          color: HexColor('#bfc8e2'),
        ),
        headline2: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          letterSpacing: 0.26,
          color: HexColor('#bfc8e2'),
        ),
        subtitle1: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15.0,
          letterSpacing: -0.04,
          color: Colors.white,
        ),
        subtitle2: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 13.0,
          letterSpacing: -0.04,
          color: Colors.white,
        ),
        bodyText1: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 13.0,
          color: Color(0xFFB1A2A2),
        ),
        bodyText2: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 11.0,
          color: Color(0xFFB1A2A2),
        ),
      ),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
        secondary: HexColor('#FBA308'),
        secondaryVariant: HexColor('#fcb539'),
        primary: primaryBlueDart,
        primaryVariant: primaryBlueColor,
      ),
    ),
  };
}

enum AppTheme { lightBlueTheme, dartBlueTheme, lightGreenTheme, dartGreenTheme }
