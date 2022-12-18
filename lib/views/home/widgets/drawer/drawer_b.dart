part of '../../../../utils/imports/app_imports.dart';

class DrawerB extends StatefulWidget {
  const DrawerB({Key? key}) : super(key: key);

  @override
  State<DrawerB> createState() => _DrawerBState();
}

String type = 'Employee';

class _DrawerBState extends State<DrawerB> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseController currentUserData =
        Provider.of<FirebaseController>(context);
    final Register auth = Provider.of<Register>(context);

    return Column(
      children: [
        //your shelves
        DrawerBComponent(
          title: "Your shelves",
          icon: AppSvg.account,
          onTap: () {
            Navigator.pushReplacementNamed(context, "/shelves");
          },
        ),
        //analysis and suggestions
        DrawerBComponent(title: "Analysis and suggestions", icon: AppSvg.data),
        //staff management
        if (currentUserData.registeredUser.userType == 'Owner')
          DrawerBComponent(
            title: "Staff management",
            icon: AppSvg.staff,
            onTap: () {
              Navigator.pushReplacementNamed(context, "/staff");
            },
          ),
        //theme
        //notifications
        DrawerBComponent(
          title: "Notifications",
          icon: AppSvg.notification,
          onTap: () {
            Navigator.pushReplacementNamed(context, "/notification");
          },
        ),
        //settings
        //more information
        DrawerBComponent(
            title: "About us",
            icon: AppSvg.information,
            onTap: () {
              MaterialPageRoute<InnerPageTerm> route = MaterialPageRoute(
                  builder: (context) => const InnerPageTerm(
                      url:
                          "https://translate.google.com/?sl=en&tl=ar&op=translate"));
              Navigator.push(context, route);
            }),
        //logout
        DrawerBComponent(
            title: "Logout",
            icon: AppSvg.logout,
            onTap: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.warning,
                animType: AnimType.scale,
                title: "Log out",
                desc: "Are you sure you want to logout?",
                dialogBackgroundColor: AppThemeChoose.getMode(context)
                    ? AppColors.main_dark
                    : AppColors.main_light,
                headerAnimationLoop: false,
                btnOkText: "Cancel",
                btnOkOnPress: () {},
                btnCancelText: "Logout",
                btnCancelOnPress: () {
                  auth.signOut();
                  currentUserData.connected = '';

                  Navigator.pushNamedAndRemoveUntil(
                      context, "/wrapper", (route) => false);
                },
              ).show();
            }),
      ],
    );
  }
}
