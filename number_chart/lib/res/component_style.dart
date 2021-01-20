import 'package:flutter/material.dart';

final titleNoScaleTextStyle = TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.w700, fontFamily: 'Lato');
final btnTextStyle = TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400);
final boldNoScaleTextStyle = TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w700, fontFamily: 'Lato', height: 1.31);
final normalTextStyle = TextStyle(fontSize: 14, color: Colors.black, fontFamily: 'Lato', height: 1.31);
final errorTextStyle = TextStyle(fontSize: 13, color: Color(0xffFF3B30), fontFamily: 'Lato', height: 1.28);

btnTextStyleCustom(Color color){
  return TextStyle(fontSize: 16, color:color, fontWeight: FontWeight.w400);
}