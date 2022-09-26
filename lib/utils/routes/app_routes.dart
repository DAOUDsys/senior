part of '../imports/app_imports.dart';

class AppRoutes{
  static Map <String, WidgetBuilder> route = {
    "/":(context) => const PageSplash(),
    "/singin":(context) => SingIn(),
    "/test":(context) => const MyTest(),
    "/shelves":(context) => PageList(title: "Your shelves", cardAspectRatio: 2,card: const ShelfCard(),),
    "/connect":(context) => const Connect(), 
    "/staff":(context) => PageList(title: "Staffs",cardAspectRatio: 6,card:const StaffCard(),), 
    "/notification":(context) => PageList(title: "Notifications",cardAspectRatio: 2.7,card: SimpleNCard(interactive:true),), 
  };
}