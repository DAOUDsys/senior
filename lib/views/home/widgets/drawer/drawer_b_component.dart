part of '../../../../utils/imports/app_imports.dart';

class DrawerBComponent extends StatelessWidget {
  const DrawerBComponent(
    {Key? key,required this.title,required this.icon, this.onTap,this.trailing })
     : super(key: key);

  final String title;
  final SvgPicture icon;
  final void Function()? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title),
        leading: icon,
        onTap: onTap,
        trailing: trailing,
    );
  }


}