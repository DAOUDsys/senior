part of '../../utils/imports/app_imports.dart';

class NewAccount extends StatefulWidget {
  const NewAccount({Key? key}) : super(key: key);

  @override
  State<NewAccount> createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {

  static String dropDownValue = 'Owner';
  var items = [   
    'Owner',
    'Employee',
  ];

  @override
  void initState() {
    super.initState();
  }
  static final GlobalKey<FormState> keyFrom = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final AuthController auth =Provider.of<AuthController>(context);

    return Scaffold(
      // resizeToAvoidBottomInset : false,
      
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
            
                  
            body:SingleChildScrollView( 
              child: Container(
              height: MediaQuery.of(context).size.height - 120,
               //decoration of the main container
              decoration: BoxDecoration(
                 borderRadius: const BorderRadius.only(topLeft: Radius.circular(36) , topRight: Radius.circular(36)),
                  color: AppThemeChoose.getMode(context)? AppColors.main_dark: AppColors.main_light,
                    ),

             //child of the main container
            //  child: Padding(padding: const EdgeInsets.only(top: 30),
              child: Padding(
                padding: const EdgeInsets.only(top:10,bottom: 10,left: 10,right: 10),
                ///////////////// the form is here /////////////////////
                child: Form(
                  key: keyFrom,
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Create new account",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("First name",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                      MyTextField(height: 70,width: 250,prefixIcon: Icon(Icons.person))
                    ],
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Last name",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                      MyTextField(height: 70,width: 250,prefixIcon: Icon(Icons.person),)
                    ],
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Mobile",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                      MyTextField(height: 70,width: 250,
                        prefixIcon: Icon(Icons.phone),
                        type: TextInputType.phone,
                        )
                    ],
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Email",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                      MyTextField(height: 70,width: 250,
                      prefixIcon: Icon(Icons.email),
                      type: TextInputType.emailAddress,
                      validError: AppValidators.isEmail,
                      )
                    ],
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Password",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                      MyTextField(height: 70,width: 250,
                      prefixIcon: const Icon(Icons.key),
                      ispassword: auth.isShown,
                        postIcon: auth.iconEye,
                        onPostIcon: () {auth.changeIconShow(auth.isShown);},
                        validError: AppValidators.isPass,
                      )
                    ],
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Password",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                      MyTextField(height: 70,width: 250,
                      prefixIcon: const Icon(Icons.key),
                      ispassword: auth.isShown,
                        postIcon: auth.iconEye,
                        onPostIcon: () {auth.changeIconShow(auth.isShown);},
                        validError: AppValidators.isPass,
                      )
                    ],
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("User type",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                      Container(  
                        width: 250,
                        height: 70,
                        decoration: BoxDecoration(
                            color: AppThemeChoose.getMode(context)? AppColors.textbox_dark:AppColors.textbox_light,
                            borderRadius: BorderRadius.circular(36),
                            boxShadow:  [BoxShadow(
                              color: AppColors.shadow_textbox_dark,
                              blurRadius: AppThemeChoose.getMode(context)? 50:30,
                              offset: const Offset(0,10)
                            )]
                        ),
                        child: Padding(padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                        child:DropdownButton(
                        
                            // the value that shown on list first
                            value: dropDownValue,
                            //the items the shown when click on button
                            items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                            }).toList(),
                            // on change 
                            onChanged: (String? newValue) {
                            setState(() {
                            dropDownValue = newValue!;});
                            },
                            // the color of the arrow
                            iconEnabledColor: AppThemeChoose.getMode(context)? AppColors.part_dark:AppColors.part_light,
                            // size of the arrow
                            iconSize: 40,
                            // to let it fill the container
                            isExpanded: true,
                        ),
                        ),
                      ),
                      
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
                            },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 65),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    ), 
                    child: const Text("Create",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    )
                  )
                  
                ]),
                ), 
              )
                
              
        )
        
            )
            
        
    );
  }
}

