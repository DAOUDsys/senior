part of '../../utils/imports/app_imports.dart';

// ignore: must_be_immutable
class SimpleNCard extends StatelessWidget {
  SimpleNCard({Key? key,this.interactive=false}) : super(key: key);
  bool? interactive;

  @override
  Widget build(BuildContext context) {
    return GridTile(
        
      
       child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width-40,
          height: 150,
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
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.notifications_active_outlined,size: 35,),
                SizedBox(
                  width: 280,
                child: Text("the cake on shelf Z expires in a week ",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                textAlign: TextAlign.justify,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                ),
                ),
                Padding(padding: EdgeInsets.only(right: 10),
                child:Text("1h",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                
                )
              ],
            ),
            const SizedBox(height: 30,),
            Divider( color: AppThemeChoose.getMode(context)? AppColors.part_dark: AppColors.part_light,
          thickness: 2, 
          indent: 0,
          endIndent: 0,
          ),
          if(interactive == true)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Text("Cancel",style: TextStyle(color: AppColors.colorFromHex("#DE4B4B"),fontWeight: FontWeight.bold,fontSize: 20),),
                
                ),
              
              TextButton(
                onPressed: () {}, 
                child: Text("Accept",style: TextStyle(color: AppColors.colorFromHex("#4BDE5F"),fontWeight: FontWeight.bold,fontSize: 20),))
            ],
          )

          ],
        )

        )
        )
       )
    );
        
            
        
      
  }
}