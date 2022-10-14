part of '../../utils/imports/app_imports.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  const MyTextField({Key? key,
   required this.width,
   required this.height,
   this.hint,
   this.prefixIcon,
   this.initialValue,
   this.type=TextInputType.text,
   this.onPostIcon,
   this.postIcon,
   this.validError,
   this.onSaved,
   this.onChanged,
   this.ispassword=false}) 
   : super(key: key);

  final String? initialValue;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validError;
  final void Function()? onPostIcon;
  final TextInputType type;
  final String? hint;
  final Icon? prefixIcon;
  final IconData? postIcon;
  final double width;
  final double height;
  final bool ispassword;
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
      
      child: TextFormField(
        validator: validError,
        onChanged: onChanged,
        onSaved: onSaved,
        initialValue: initialValue,
        keyboardType: type,
        //font size that we type in the text filed
        style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w400),
        //to show the password as dots
        obscureText: ispassword,
        decoration: InputDecoration(
          labelText: hint ?? "",
          labelStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),

          enabledBorder: const OutlineInputBorder(
            borderSide:BorderSide(color: Colors.transparent,width: 10)),
          focusedBorder: const OutlineInputBorder(
            borderSide:BorderSide(color: Colors.transparent)),

          errorBorder: const OutlineInputBorder(
            borderSide:BorderSide(color: Colors.transparent,width: 10)),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide:BorderSide(color: Colors.transparent)),
                    
          prefixIcon: prefixIcon,
          suffixIcon: IconButton(onPressed: onPostIcon, icon: Icon(postIcon,size: 25,)),
          border: InputBorder.none,
        ),
      )
                              
                            
    );
                        
  }
}