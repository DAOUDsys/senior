part of '../../utils/imports/app_imports.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  MyTextField({Key? key, this.hint,this.prefixIcon,required this.width,required this.height,this.ispassword=false}) : super(key: key);
  String? hint;
  Icon? prefixIcon;
  double width;
  double height;
  bool ispassword;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppThemeChoose.getMode(context)? AppColors.textbox_dark:AppColors.textbox_light,
          borderRadius: BorderRadius.circular(36),
          boxShadow:  [BoxShadow(
            color: AppColors.shadow_textbox_dark,
            blurRadius: AppThemeChoose.getMode(context)? 50:30,
            offset: const Offset(0,10)
          )]
      ),
      //the main text filed
      child: TextField(
        //font size that we type in the text filed
        style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w400),
        //to show the password as dots
        obscureText: ispassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
          prefixIcon: prefixIcon,
          border: InputBorder.none,
        ),
      )
                              
                            
    );
                        
  }
}