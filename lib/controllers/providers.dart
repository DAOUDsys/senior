part of '../../utils/imports/app_imports.dart';



  List<SingleChildWidget> providers = [  
      // all providers in the project
      ChangeNotifierProvider(create: (_) => ControllerTheme(),),
      ChangeNotifierProvider(create: (_) => ControllerApi(),),
      ChangeNotifierProvider(create: (_) => Register()),
      ChangeNotifierProvider(create: (_) => ControllerDB()),
      ChangeNotifierProvider(create: (_) => FirebaseController()),

  ];