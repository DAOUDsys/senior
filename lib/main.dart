//import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'utils/imports/app_imports.dart';

void main() {
  runApp(const AppRestart(child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static List<SingleChildWidget> providers = [
      // all providers in the project
      ChangeNotifierProvider(create: (context) => ControllerTheme(),),
      ChangeNotifierProvider(create: (context) => ControllerApi(),),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: providers,
       
    builder: (context, child) { 
      // provider theme
      final ControllerTheme manageTheme =Provider.of<ControllerTheme>(context);
      // check theme
      manageTheme.sharedTheme();
      return MaterialApp(
      onGenerateTitle: (context) => "shelf system",
      debugShowCheckedModeBanner: false,
      title: "shelf system",
      initialRoute: "/",
      routes: AppRoutes.route,
      theme: AppThemeChoose.lightTheme(context),
      darkTheme: AppThemeChoose.DarkTheme(context),
      //themeMode: manageTheme.themeMode,
    );
    },
    
    );
    
  }
}

