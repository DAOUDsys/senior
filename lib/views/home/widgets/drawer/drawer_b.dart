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
        //theme
          //DrawerBComponent(title: "Theme", icon: AppSvg.theme, trailing: const DrawerTheme(), ),
        //notifications
          DrawerBComponent(title: "Notifications", icon: AppSvg.notification),
        //settings
          DrawerBComponent(title: "Settings", icon: AppSvg.settings),
        //more information
          DrawerBComponent(title: "About us", icon: AppSvg.information, 
          onTap: (){
            MaterialPageRoute<InnerPageTerm> route =MaterialPageRoute(builder: (context) => const   InnerPageTerm(url: "https://translate.google.com/?sl=en&tl=ar&op=translate") );
            Navigator.push(context, route);}),
        //logout
          DrawerBComponent(title: "Logout", icon: AppSvg.logout),
      ],
    );
    
  }

}