
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;

  static init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
    defaultSize = orientation == Orientation.landscape
    ? screenHeight *0.024 : screenWidth *0.024;
  } 
}
double getsizeWidth(double input){
  double screenWidth = SizeConfig.screenWidth;
  return (input /375.0)* screenWidth;
}
double getsizeHeight(double input){
  double screenHeight = SizeConfig.screenHeight;
  return (input /812.0)* screenHeight;
}