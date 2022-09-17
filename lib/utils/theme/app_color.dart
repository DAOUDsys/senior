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
  // ignore: non_constant_identifier_names
  static final Color main_dark = colorFromHex("#414141");
  // ignore: non_constant_identifier_names
  static final Color part_dark = colorFromHex("#02D8C4");
  // ignore: non_constant_identifier_names
  static final Color white_dark = colorFromHex("#FFFFFF");
  // ignore: non_constant_identifier_names
  static final Color textbox_dark = colorFromHex("#747474");
  // ignore: non_constant_identifier_names
  static final Color shadow_textbox_dark = colorFromHex("#292929","7F");

  //light 
  // ignore: non_constant_identifier_names
  static final Color main_light = colorFromHex("#ffffff");
  // ignore: non_constant_identifier_names
  static final Color part_light = colorFromHex("#66ACFC");
  // ignore: non_constant_identifier_names
  static final Color black_light = colorFromHex("#000000");
  // ignore: non_constant_identifier_names
  static final Color textbox_light = colorFromHex("#F2EEEE");
  // ignore: non_constant_identifier_names
  static final Color textbox_text_light = colorFromHex("#ACA9A9");



}