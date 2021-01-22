import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/ct_colors.dart';

final titleNoScaleTextStyle = TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.w700, fontFamily: 'Lato');
final btnTextStyle = TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400);
final boldNoScaleTextStyle = TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w700, fontFamily: 'Lato', height: 1.31);
final normalTextStyle = TextStyle(fontSize: 14, color: Colors.black, fontFamily: 'Lato', height: 1.31);
final normalTextStyleWhite = TextStyle(fontSize: 14, color: Colors.white, fontFamily: 'Lato', height: 1.31);
final errorTextStyle = TextStyle(fontSize: 13, color: Color(0xffFF3B30), fontFamily: 'Lato', height: 1.28);

btnTextStyleCustom(Color color){
  return TextStyle(fontSize: 16, color:color, fontWeight: FontWeight.w400);
}
var lightStatusBar = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.light,
  systemNavigationBarColor: mainColor,
);
var darkStatusBar = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.light,
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarColor: mainColor,
);