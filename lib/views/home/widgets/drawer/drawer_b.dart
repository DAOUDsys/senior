part of '../../../../utils/imports/app_imports.dart';

class DrawerB extends StatelessWidget {
  const DrawerB({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //your shelves
          DrawerBComponent(title: "Your shelves", icon: AppSvg.account,),
        //analysis and suggestions
          DrawerBComponent(title: "Analysis and suggestions", icon: AppSvg.data),
        //staff management
          DrawerBComponent(title: "Staff management", icon: AppSvg.staff),
        //notifications
          DrawerBComponent(title: "Notifications", icon: AppSvg.notification),
        //settings
          DrawerBComponent(title: "Settings", icon: AppSvg.settings),
        //more information
          DrawerBComponent(title: "More information", icon: AppSvg.information),
        //logout
          DrawerBComponent(title: "Logout", icon: AppSvg.logout),
      ],
    );
    
  }

}