part of '../../../../utils/imports/app_imports.dart';


class DrawerA extends StatefulWidget {
  const DrawerA({Key? key}) : super(key: key);

  @override
  State<DrawerA> createState() => _DrawerAState();
}

class _DrawerAState extends State<DrawerA> {
  @override
  void initState() {
    super.initState();
  
    
  }

  @override
  Widget build(BuildContext context) {

    final FirebaseController currentUserData = Provider.of<FirebaseController>(context);
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              //image
              Container(
                width: 100,
                height: 125,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80"),
                    )),
              ),
              //information
              Column(
                children: [
                  //name
                  Text(
                    currentUserData.registeredUser.name!,
                    style: const TextStyle(fontSize: 18),
                  ),

                  //email
                  Text(currentUserData.registeredUser.email!, style: const TextStyle(fontWeight: FontWeight.bold) ,maxLines: 1,overflow: TextOverflow.ellipsis,),

                  const SizedBox(
                    height: 10,
                  ),
                  //uid
                  if(currentUserData.registeredUser.userType == 'Owner')
                  TextButton(
                      onPressed: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.scale,
                          title: "Owner ID",
                          desc: currentUserData.registeredUser.id,
                          dialogBackgroundColor: AppThemeChoose.getMode(context)
                              ? AppColors.main_dark
                              : AppColors.main_light,
                          headerAnimationLoop: false,
                        ).show();
                      },
                      child: Text("User ID",
                          style: TextStyle(
                            fontSize: 20,
                            color: AppThemeChoose.getMode(context)
                                ? AppColors.part_dark
                                : AppColors.part_light,
                          )))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
