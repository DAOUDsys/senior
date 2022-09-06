//import 'dart:async';
import 'package:flutter/material.dart';
import 'utils/imports/app_imports.dart';

void main() {
  runApp(const AppRestart(child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "shelf",
      initialRoute: "/",
      routes: appRoutes.route,
      theme: AppThemeChoose.lightTheme(context),
      darkTheme: AppThemeChoose.DarkTheme(context),
      
    );
    
  }
}

