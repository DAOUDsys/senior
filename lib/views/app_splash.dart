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
        Navigator.pushReplacementNamed(context, "/wrapper");
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
      backgroundColor: AppThemeChoose.getMode(context)? AppColors.main_dark:AppColors.main_light,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
             Icons.shopping_cart_rounded,
             size: 150,
            ),
            Text("Manage your shelves system",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontFamily: "Cursive"),),
          ]
        ),
      )
    );
  }
}