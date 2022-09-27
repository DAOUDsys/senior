part of '../../utils/imports/app_imports.dart';

class NewAccount extends StatelessWidget {
  const NewAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      drawer: const DrawerBody(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          elevation: 0,
          title: const Text("Sign up",style: TextStyle(fontSize: 28),),
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
            //  child: Padding(padding: const EdgeInsets.only(top: 30),
              child: Padding(
                padding: const EdgeInsets.only(top:10,bottom: 10,left: 10,right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Create new account",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("First name",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                      MyTextField(height: 70,width: 250,prefixIcon: const Icon(Icons.person))
                    ],
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Last name",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                      MyTextField(height: 70,width: 250,prefixIcon: const Icon(Icons.person),)
                    ],
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Mobile",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                      MyTextField(height: 70,width: 250,prefixIcon: const Icon(Icons.phone),)
                    ],
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Email",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                      MyTextField(height: 70,width: 250,prefixIcon: const Icon(Icons.email),)
                    ],
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Password",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                      MyTextField(height: 70,width: 250,prefixIcon: const Icon(Icons.key),)
                    ],
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Password",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                      MyTextField(height: 70,width: 250,prefixIcon: const Icon(Icons.key),)
                    ],
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("User type",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                      MyTextField(height: 70,width: 250,)
                    ],
                  ),
                  Padding(padding: const EdgeInsets.only(left: 200),
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 65),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      
                    ), 
                    child: const Text("Create",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    )
                  )
                ]),
              )
                
              
        )
        
        
            
        
    );
  }
}

