part of '../../utils/imports/app_imports.dart';

// enum loading
enum ChoiceLoading {
  profile,image,page,webView,button
}

// app loading
class AppLoading extends StatelessWidget
{
  const AppLoading({Key? key, this.loading}) : super(key: key);
  final ChoiceLoading? loading;
  @override
  Widget build(BuildContext context) {
    switch(loading)
    {
      case ChoiceLoading.image:
      return  SpinKitFadingCircle(
        color: AppThemeChoose.getMode(context)? Colors.purple : Colors.lightGreen,

      );

      case ChoiceLoading.page:
        return  SpinKitThreeInOut(
          color: AppThemeChoose.getMode(context)? Colors.purple : Colors.lightGreen,
        );
      
      case ChoiceLoading.profile:
        return  SpinKitFadingFour(
        color: AppThemeChoose.getMode(context)? Colors.purple : Colors.lightGreen,  
        );
                
      case ChoiceLoading.webView:
        return  SpinKitFadingCube(
        color: AppThemeChoose.getMode(context)? Colors.purple : Colors.lightGreen,
      );

      case ChoiceLoading.button:
        return  SpinKitFadingCircle(
        color: AppThemeChoose.getMode(context)? AppColors.part_dark : AppColors.part_light,
      );
      
      default :
      return  SpinKitFadingCube(
        color: AppThemeChoose.getMode(context)? Colors.purple : Colors.lightGreen,
      );
        
    }
  }

}
