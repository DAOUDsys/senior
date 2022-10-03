part of '../imports/app_imports.dart';

class AppRoutes{
  static Map <String, WidgetBuilder> route = {
    "/":(context) => const PageSplash(),
    "/singin":(context) => SingIn(),
    "/test":(context) => const MyTest(),
    "/connect":(context) => const Connect(), 
    "/staff":(context) => PageList(title: "Staffs",cardAspectRatio: 6,card:const StaffCard(),), 
    "/shelves":(context) => PageList(title: "Your shelves", cardAspectRatio: 2,card: const ShelfCard(),),
    "/notification":(context) => PageList(title: "Notifications",cardAspectRatio: 2.7,card: SimpleNCard(interactive:true),),
    "/newaccount": (context) => const NewAccount(),
    "/edit": (context) => const ShelfSettings(),
  };
}