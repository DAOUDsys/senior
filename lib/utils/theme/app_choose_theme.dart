part of '../imports/app_imports.dart';

class AppThemeChoose {


  
  
  //check is dark or not
  static bool getModeLess()
  {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode =  brightness == Brightness.dark;
    return isDarkMode;
  }
  static bool getMode(BuildContext context)
  {
   var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return isDarkMode;
  }


  //light theme
  static ThemeData DarkTheme(BuildContext context) {
    return ThemeData.dark().copyWith(
      //backgroundColor: AppColors.part_dark,
      primaryColor: AppColors.main_dark,
      splashColor: AppColors.part_dark,
      scaffoldBackgroundColor: AppColors.part_dark,
      iconTheme: IconThemeData(color: AppColors.part_dark),
        
      colorScheme: ThemeData().colorScheme.copyWith(
        //for main color
        primary: AppColors.part_dark,
        
        //background: AppColors._dark,
        //for text in buttons and so on
        //onPrimary: AppColors.white_dark,
        //for secondary items
        secondary: AppColors.main_dark,
        
      ),
      textTheme: Theme.of(context).textTheme.apply(
        bodyColor: AppColors.white_dark, 
        displayColor: AppColors.white_dark,
      ),
      


    );
  }
  //light theme
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData.light().copyWith(
      backgroundColor: AppColors.part_light,
      primaryColor: AppColors.main_light,
      scaffoldBackgroundColor: AppColors.part_light,
      iconTheme: IconThemeData(color: AppColors.part_light),
      colorScheme: ThemeData().colorScheme.copyWith(
        //for main color
        primary: AppColors.part_light,
        //for text in buttons and so on
        //onPrimary: AppColors.white_dark,
        //for secondary items
        secondary: AppColors.part_light,
      ),
      textTheme: Theme.of(context).textTheme.apply(
        bodyColor: AppColors.black_light, 
        displayColor: AppColors.black_light,
      ),
      
      

    );
  }
 
 
 

   
  
}
