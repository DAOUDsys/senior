part of '../../utils/imports/app_imports.dart';

class StaffCard extends StatelessWidget {
  const StaffCard({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GridTile(

       child: Center(
        child: SizedBox(
          width: 380,
          height: 120,
        child: Container(
          decoration: BoxDecoration(
          color: AppThemeChoose.getMode(context)? AppColors.textbox_dark: AppColors.textbox_light,
          borderRadius: BorderRadius.circular(50),
          ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppSvg.account,
            const Text("Staff name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            IconButton(onPressed: () {}, icon: Icon(Icons.cancel,color: AppColors.colorFromHex("#DE4B4B"),size: 35,))
          ],
        )
        )
        )
       )
    );
        
            
        
      
  }
}