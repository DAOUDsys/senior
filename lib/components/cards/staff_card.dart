part of '../../utils/imports/app_imports.dart';

class StaffCard extends StatelessWidget {
  const StaffCard({Key? key,required this.data}) : super(key: key);
  final ModelStaff data;


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
          boxShadow:  [BoxShadow(
            color: AppColors.shadow_textbox_dark,
            blurRadius: AppThemeChoose.getMode(context)? 50:15,
            offset: const Offset(0,10)
          )]
      
          ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppSvg.account,
            Text(data.name ?? '',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            IconButton(onPressed: () {}, icon: Icon(Icons.cancel,color: AppColors.colorFromHex("#DE4B4B"),size: 35,))
          ],
        )
        )
        )
       )
    );
        
            
        
      
  }
}