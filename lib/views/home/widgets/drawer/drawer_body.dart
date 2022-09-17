part of '../../../../utils/imports/app_imports.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
                  topRight: Radius.circular(36),
                  bottomRight: Radius.circular(36)),
            ),
      child: Column(
        children: [
          // part A
          const DrawerA(),
          //line
          Divider(color: AppThemeChoose.getMode(context)? Colors.white:Colors.black,),
          //part B 
          const DrawerB(),

        ],
      ),
    );
    
  }

}
