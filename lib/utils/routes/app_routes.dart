part of '../imports/app_imports.dart';

class AppRoutes{
  static Map <String, WidgetBuilder> route = {
    "/":(context) => const PageSplash(),
    "/singin":(context) => SingIn(),
    "/test":(context) => const MyTest(),
  };
}