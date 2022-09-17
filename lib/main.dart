//import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils/imports/app_imports.dart';

void main() {
  runApp(const AppRestart(child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: (context) => ManageTheme(),
    builder: (context, child) { 
      // provider theme
      final ManageTheme manageTheme =Provider.of<ManageTheme>(context);
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

