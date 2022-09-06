part of '../imports/app_imports.dart';

class appRoutes{
  static Map <String, WidgetBuilder> route = {
    "/":(context) => const PageSplash(),
    "/singin":(context) => SingIn(),
    "/test":(context) => MyTest(),
  };
}