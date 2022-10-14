part of '../utils/imports/app_imports.dart';

class ConfigMaterial extends StatelessWidget {
  const ConfigMaterial({Key? key, required this.child}) : super(key: key);
  final Widget? child;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: child,
    );
  }

}