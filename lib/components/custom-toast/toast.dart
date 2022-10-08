part of '../../utils/imports/app_imports.dart';

class CustomToast {
  static toast(String msg,BuildContext context){
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: AppThemeChoose.getMode(context)? AppColors.main_light:AppColors.main_dark,
        textColor:  AppThemeChoose.getMode(context)? AppColors.main_dark:AppColors.main_light,
        fontSize: 16.0,
    );
  }
  
  static toastLess(String msg){
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: AppThemeChoose.getModeLess()? AppColors.main_light:AppColors.main_dark,
        textColor:  AppThemeChoose.getModeLess()? AppColors.main_dark:AppColors.main_light,
        fontSize: 16.0,
    );
  }
}