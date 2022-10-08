part of '../utils/imports/app_imports.dart';

class ControllerTheme extends ChangeNotifier{
  /// [theme] false = light 
  /// [theme] true = dark
  bool theme=false;

  /// [updateTheme] change theme from light to dark
  void updateTheme (bool value) {
    theme = value;
    setTheme(value);
    notifyListeners();
  }


  /// [themeMode] switching the theme
  ThemeMode get themeMode => theme ? ThemeMode.dark : ThemeMode.light;

  /// [sharedTheme] get value from local storage and set theme to new value
  Future<void> sharedTheme() async {
    theme= await getTheme;
    notifyListeners();
  }

  // shared preferences
  final String keyTheme='THEME';
  /// [setTheme] save key theme in value bool
  Future<void> setTheme (bool value) async{
    final SharedPreferences sharedPref = await  SharedPreferences.getInstance();
    await sharedPref.setBool(keyTheme, value);
  }
  ///[getTheme] get data saved in local device
  ///[getBool] default is false => light
  Future<bool> get getTheme async{
    final SharedPreferences sharedPref = await  SharedPreferences.getInstance();
    return sharedPref.getBool(keyTheme) ?? false;

  }
}