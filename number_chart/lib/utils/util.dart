import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
/// text
class Strings{
  static String titleApp = "Thống kê số liệu";
  static String titleLogin = "Đăng nhập";
  static String start = "Bắt đầu";
  /// title chart
  static String customer = "Người chơi";
  static String typeGame = "Loại chơi";
  static String quantity = "Số lượng";
  static String priceBuy = "Tiền thu";
  static String priceReward = "Tiền trả";

}
void showToast(message) {
  BotToast.showText(text: message, textStyle: TextStyle(fontSize: 14, color: Colors.white));
}

class PhoneUtils{
  static String formatPhoneNumber(String rawPhone) {
    rawPhone = rawPhone.replaceAll(" ", "");
    String phoneFormat = "";
    if (rawPhone.length > 4) {
      phoneFormat += rawPhone.substring(0, 4);
      rawPhone = rawPhone.substring(4);
    } else {
      return rawPhone;
    }
    phoneFormat += " ";
    if (rawPhone.length > 3) {
      phoneFormat += rawPhone.substring(0, 3);
      rawPhone = rawPhone.substring(3);
    } else {
      phoneFormat += rawPhone;
      return phoneFormat;
    }

    phoneFormat += " " + rawPhone;

    return phoneFormat;
  }
}