part of '../imports/app_imports.dart';


class  AppRestart  extends StatefulWidget {
  const AppRestart({Key? key,required this.child}) : super(key:key);
  final Widget child;
  @override
  State<AppRestart> createState() => _AppRestart();
  //restart method
  static reBuild(BuildContext context) => 
  context.findAncestorStateOfType<_AppRestart>()?.restartApp();
}

class _AppRestart extends State<AppRestart> {
  // ignore: unused_field
  Key _key=UniqueKey();
  //restart app
  void restartApp() {
    _key=UniqueKey();
    setState(() {});
    //AppRestart.reBuild(context);
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(child: widget.child);
  }

}