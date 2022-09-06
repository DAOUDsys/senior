part of '../utils/imports/app_imports.dart';

class PageSplash extends StatefulWidget {
  const PageSplash ({Key? key}) : super(key: key);

  @override
  State<PageSplash> createState() => _PageSplashState();
}
class _PageSplashState extends State<PageSplash>{

  @override
  void initState() {
    
    super.initState();
    Timer(const Duration(seconds: 5),() {
        Navigator.pushReplacementNamed(context, "/singin");
      });
  }

  @override
  void dispose() {
    
    super.dispose();
    dev.log("disposed");
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("five seconds"),
          ]
        ),
      )
    );
  }
}