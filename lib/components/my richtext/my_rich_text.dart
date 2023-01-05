part of '../../utils/imports/app_imports.dart';

// ignore: must_be_immutable
class MyRichText extends StatelessWidget {
  MyRichText({
    Key? key,
    required this.text1,
    required this.text2,
    required this.width,
    required this.height,
  }) : super(key: key);
  String text1;
  String text2;
  double width;
  double height;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: AppThemeChoose.getMode(context)
                ? AppColors.textbox_dark
                : AppColors.textbox_light,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                  color: AppColors.shadow_textbox_dark,
                  blurRadius: AppThemeChoose.getMode(context) ? 50 : 30,
                  offset: const Offset(0, 10))
            ]),
        //the main text filed
        child: Center(
            child: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: text1,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: DefaultTextStyle.of(context).style.color),
            ),
            TextSpan(
              text: text2,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppThemeChoose.getMode(context)
                    ? Colors.purple
                    : Colors.lightGreen,
              ),
            ),
          ]),
        )));
  }
}
