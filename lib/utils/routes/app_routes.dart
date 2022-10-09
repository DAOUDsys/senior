part of '../imports/app_imports.dart';

class AppRoutes{
  static Map <String, WidgetBuilder> route = {
    "/":(context) => const PageSplash(),
    "/singin":(context) => SingIn(),
    "/test":(context) => const MyTest(),
    "/connect":(context) => const Connect(), 
    "/staff":(context) => StaffList(), 
    "/shelves":(context) => ShelfList(),
    "/notification":(context) => NotificationList(),
    "/newaccount": (context) => const NewAccount(),
    "/edit": (context) => const ShelfSettings(),
  };
}