part of '../../utils/imports/app_imports.dart';

class ShelfCard extends StatelessWidget {
  const ShelfCard({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GridTile(
        header: Column(
          children: [
         Row(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppSvg.account,
            const Text("Shelf name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),  
            IconButton(onPressed: () {}, icon: const Icon( Icons.mode_edit_outline_rounded)),
          ],
        ),
          Divider( color: AppThemeChoose.getMode(context)? AppColors.part_dark: AppColors.part_light,
          thickness: 2, 
          indent: 20,
          endIndent: 20,
          )
          ]
          ),

       child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
       child: Container(
        padding: const EdgeInsets.only(top: 100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36) ,
          color: AppThemeChoose.getMode(context)? AppColors.textbox_dark: AppColors.textbox_light,
        ),
        // ignore: sort_child_properties_last
        child: Column(
          children: <Widget> [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                Text(" Item name: ", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                Text("ExpireDate: ", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget> [
                Text(" Item type: ", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                Text("Status: ", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ],
            ),
            const Text(" Number of items: ", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          ],
        ),
        
        ),
       )
    );
        
            
        
      
  }
}