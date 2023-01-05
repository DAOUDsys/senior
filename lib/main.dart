//import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'utils/imports/app_imports.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  runApp(const AppRestart(
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

void requestPermissionForNotifications() async {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  NotificationSettings settings = await _firebaseMessaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');
}

String messageTitle = "Empty";
String notificationAlert = "alert";

/////////////////////////////////////////
class _MyAppState extends State<MyApp> {
  late Future<FirebaseApp> firebaseApp;
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    firebaseApp = Firebase.initializeApp();

    // requestPermissionForNotifications();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
        future: firebaseApp,
        builder: (context, snapshot) {
          // if(snapshot.connectionState == ConnectionState.waiting) {
          //   return const ConfigMaterial(child: AppLoading(loading: ChoiceLoading.page),);
          // }

          // if(snapshot.connectionState == ConnectionState.done) {

          // if(snapshot.hasData) {

          return MultiProvider(
            providers: providers,
            builder: (context, child) {
              // provider theme
              final ControllerTheme manageTheme =
                  Provider.of<ControllerTheme>(context);
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
              );
            },
          );
          // }
          // else {
          //   return const ConfigMaterial(child: Text("                     There is no data from Firebase",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 30),),);

          // }
          // }

          // else {
          //   return const ConfigMaterial(child: Text("Error while connect to Firebase",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 30),),);
          // }
        });
  }
}
