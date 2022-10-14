part of '../../utils/imports/app_imports.dart';

class ShelfSettings extends StatelessWidget {
  const ShelfSettings({Key? key}) : super(key: key);
  static final GlobalKey<FormState> keyFrom = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset : false,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          elevation: 0,
          title: const Text("Shelf settings",style: TextStyle(fontSize: 28),),
          centerTitle: true,
          ),
          ),
             // scaffold color is the same as appbar to let it seem like curves and the container has the opposite color
             backgroundColor: AppThemeChoose.getMode(context)? AppColors.part_dark: AppColors.part_light,
           // using singleChildScrollView to let the keyboard work well and don't cover or push the text fields in the page
           body:SingleChildScrollView( 
            //container that have the grid inside it and its the body
              child: Container(
                //height to let container cover its space to let the SingleChildScrollView work well
                // 120 is the hight of appbar
              height: MediaQuery.of(context).size.height - 120,
               //decoration of the main container
              decoration: BoxDecoration(
                 borderRadius: const BorderRadius.only(topLeft: Radius.circular(36) , topRight: Radius.circular(36)),
                  color: AppThemeChoose.getMode(context)? AppColors.main_dark: AppColors.main_light,
                    ),

             //child of the main container
              child: Padding(
                padding: const EdgeInsets.only(top:10,bottom: 10,left: 10,right: 10),
                ///////////////// the form is here /////////////////////
                child: Form(
                  key: keyFrom,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Edit shelf properties",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                       Text("Name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                      MyTextField(height: 70,width: 250,prefixIcon:  Icon(Icons.title))
                    ],
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                       Text("Weight",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                      MyTextField(height: 70,width: 250,
                      prefixIcon:  Icon(Icons.line_weight_rounded),
                      type: TextInputType.number,)
                    ],
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                       Text("Expire date",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                      MyTextField(height: 70,width: 250,
                      prefixIcon:  Icon(Icons.date_range),
                      type: TextInputType.datetime,
                      validError: AppValidators.isDate,
                      )
                      
                    ],
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Price",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                      MyTextField(height: 70,width: 250,
                      prefixIcon: Icon(Icons.attach_money),
                      type: TextInputType.number,)
                    ],
                  ),
                  
                  Padding(padding: const EdgeInsets.only(left: 200),
                  child: ElevatedButton(
                    onPressed: (){
                            if(keyFrom.currentState?.validate() ?? false) {
                              
                            }
                            else {
                              dev.log("error while login");
                            }
                            // Navigator.pushNamed(context, "/test");
                            },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(120, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      
                    ), 
                    child: const Text("Edit",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                    )
                  ),

                  Padding(padding: const EdgeInsets.only(left: 200),
                  child: ElevatedButton(
                    onPressed: (){Navigator.pop(context);},
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(120, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      
                    ), 
                    child: const Text("Cancel",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                    )
                  )


                ]),
              )
              )
              
                
              
        )
        
           )
            
        
    );
  }
}

