part of '../../utils/imports/app_imports.dart';

class Connect extends StatelessWidget {
  const Connect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      drawer: const DrawerBody(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          elevation: 0,
          title: const Text("Connect",style: TextStyle(fontSize: 28),),
          centerTitle: true,
          ),
          ),
          // scaffold color is the same as appbar to let it seem like curves and the container has the opposite color
      backgroundColor: AppThemeChoose.getMode(context)? AppColors.part_dark: AppColors.part_light,
      //container that have the grid inside it and its the body
      body: Container(
          //decoration of the main container
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(36) , topRight: Radius.circular(36)),
            color: AppThemeChoose.getMode(context)? AppColors.main_dark: AppColors.main_light,
            ),

          //child of the main container
          child: Padding(padding:const EdgeInsets.only(top: 90),
          
            child: Center(
              
              child: Container(
                width: 380,
                height: 300,
                decoration: BoxDecoration(
                  color: AppThemeChoose.getMode(context)? AppColors.textbox_dark: AppColors.textbox_light,
                  boxShadow: [BoxShadow(
                               color: AppColors.shadow_textbox_dark,
                               blurRadius: AppThemeChoose.getMode(context)? 50:30,
                               offset: const Offset(0,10)
                    )],
                  borderRadius: BorderRadius.circular(36),
                  
                ),
                child: Column(
                  // to make space between column components
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //the text that shown in over the text filed 
                    const Text("Enter owner user name to connect",style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    // size box to set width for text filed
                    SizedBox(
                      width: 300,
                    child: TextField(
                      style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                      showCursor: false,
                      decoration: InputDecoration(
                        prefix: const Text("  # ",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                        isDense: true,
                        filled: true,
                        fillColor: AppThemeChoose.getMode(context)? Colors.grey:Colors.white60,
                        //border: InputBorder.none,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(36)),

                      ),
                    ),
                    ),
                      //padding: const EdgeInsets.only(top: 20),
                      ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 66),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                      ),
                      onPressed: () {},
                       child: const Text("Connect",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold), )
                       )
                       
                  ],
                ),
              ),
            ),
          ),
          ),

        );
        
        
            
        
    
  }
}

