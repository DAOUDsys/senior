part of '../imports/app_imports.dart';

class AppRoutes{
  static Map <String, WidgetBuilder> route = {
    "/":(context) => const PageSplash(),
    "/singin":(context) => SingIn(),
    "/verifyCode":(context) => const VerifyCode(),
    "/test":(context) => const MyTest(),
    "/connect":(context) => const Connect(), 
    "/staff":(context) => const StaffList(), 
    "/shelves":(context) => const ShelfList(),
    "/notification":(context) => const NotificationList(),
    "/newaccount": (context) => const NewAccount(),
    "/edit": (context) => const ShelfSettings(),
  };
}