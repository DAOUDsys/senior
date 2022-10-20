part of '../../utils/imports/app_imports.dart';

class ShelfCard extends StatelessWidget {
  const ShelfCard({Key? key,required this.data}) : super(key: key);
  final ModelShelf data;

  @override
  Widget build(BuildContext context) {
    ControllerDB db = Provider.of(context);
    String name = data.name ?? '';
    String expireDate = data.expireDate ?? '';
    String price = data.price ?? '' ;
    String weight = data.weight ?? '';
    String location = data.location ?? '';
    

    return GridTile(
        header: Column(
          children: [
         Row(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppSvg.account,
            Text(name,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),  
            IconButton(
              onPressed: () async {
                  db.currentShelf = dataModel;
                  Navigator.pushNamed(context, "/edit");
                
                },
               icon: const Icon( Icons.mode_edit_outline_rounded)),
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
        padding: const EdgeInsets.only(top: 80),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36) ,
          color: AppThemeChoose.getMode(context)? AppColors.textbox_dark: AppColors.textbox_light,
          boxShadow:  [BoxShadow(
            color: AppColors.shadow_textbox_dark,
            blurRadius: AppThemeChoose.getMode(context)? 50:15,
            offset: const Offset(0,10)
          )]
        ),
        // ignore: sort_child_properties_last
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget> [

              MyRichText(text1: "Price: ", text2: price, width: 300, height: 30),
              MyRichText(text1: "ExpireDate: ", text2: expireDate, width: 300, height: 30),
              MyRichText(text1: "No of items: ", text2: weight, width: 300, height: 30),
              MyRichText(text1: "location: ", text2: location, width: 300, height: 30),
            
          ],
        ),
        
        ),
       )
    );
        
            
        
      
  }

  ModelShelvesDB get dataModel {
    return ModelShelvesDB(
      expireDate: data.expireDate,
      id: data.id,
      name: data.name,
      price: data.price,
      weight: data.weight,
      location: data.location,
      );
  }

}