part of '../imports/app_imports.dart';

class AppColors {
  static Color colorFromHex(String c,[String opacity ='FF'])
  {
    // remove #
    String cw = c.replaceAll('#', '');
    //convert to color and return
    return Color(int.parse(opacity + cw,radix: 16));
  }
  //dark colors
  static final Color main_dark = colorFromHex("#414141");
  static final Color part_dark = colorFromHex("#02D8C4");
  static final Color white_dark = colorFromHex("#FFFFFF");
  static final Color textbox_dark = colorFromHex("#747474");
  static final Color shadow_textbox_dark = colorFromHex("#292929","7F");

  //light colors
  static final Color main_light = colorFromHex("#ffffff");
  static final Color part_light = colorFromHex("#66ACFC");
  static final Color black_light = colorFromHex("#000000");
  static final Color textbox_light = colorFromHex("#F2EEEE");
  static final Color textbox_text_light = colorFromHex("#ACA9A9");



}