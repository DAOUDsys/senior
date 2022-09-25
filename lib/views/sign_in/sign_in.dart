part of '../../utils/imports/app_imports.dart';

// ignore: use_key_in_widget_constructors
class SingIn extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 55),
        width: double.infinity,
        /*decoration: BoxDecoration(
            color:  AppColors.part_dark,
            ),*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 35,),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      Text("Welcome back", style: TextStyle(color: AppColors.white_dark, fontSize: 40, fontWeight: FontWeight.bold), ),
                      const SizedBox(height: 10,),
                      Text("Login to get started", style: TextStyle(color: AppColors.white_dark, fontSize: 25, ), ),
                  ]
                )              
              ),
              const SizedBox(height: 20,),
              Expanded(
                child: Container(
                  decoration:  BoxDecoration(
                    color: AppThemeChoose.getMode(context)? AppColors.main_dark: AppColors.main_light,///color of expanded
                    boxShadow: [BoxShadow(
                      color: AppColors.shadow_textbox_dark,
                      blurRadius: 50,
                    )],
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(36) , topRight: Radius.circular(36)),

                  ),
                  child: Padding(
                    
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Padding(padding:  EdgeInsets.only(top: 40,left: 30,),
                        child: Text("LOGIN", style: TextStyle(/*color: AppColors.white_dark,*/ fontSize: 30,fontWeight: FontWeight.bold ), ),
                        ),
                        // padding between login text and password text box
                        const SizedBox(height: 70,),
                        //Container for user name text box
                         Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppThemeChoose.getMode(context)? AppColors.textbox_dark:AppColors.textbox_light,
                            borderRadius: BorderRadius.circular(36),
                            boxShadow: [BoxShadow(
                               color: AppColors.shadow_textbox_dark,
                               blurRadius:AppThemeChoose.getMode(context)? 50:30,
                               offset: const Offset(0,10)
                    )]
                          ),
                          child: Column(
                            children: <Widget>[
                               Padding(padding: const EdgeInsets.only(left: 20),
                               child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'User name',
                                  suffixIcon: Icon(Icons.person, color: AppColors.main_dark,),
                                  hintStyle: const TextStyle(/*color: AppColors.white_dark,*/fontSize: 20,fontWeight: FontWeight.bold),
                                  border: InputBorder.none,
                                ),
                              )
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 25),
                        //Container for password text box
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppThemeChoose.getMode(context)? AppColors.textbox_dark:AppColors.textbox_light,
                            borderRadius: BorderRadius.circular(36),
                            boxShadow:  [BoxShadow(
                               color: AppColors.shadow_textbox_dark,
                               blurRadius: AppThemeChoose.getMode(context)? 50:30,
                               offset: const Offset(0,10)
                    )]
                          ),
                          child: Column(
                            children:  <Widget>[
                               Padding(padding: const EdgeInsets.only(left: 20),
                               child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                  hintText: 'Password',
                                  suffixIcon: Icon(Icons.key , color: AppColors.main_dark,),
                                  hintStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                  border: InputBorder.none,
                                ),
                              )
                              )
                            ],
                          ),
                        ),
                        //padding between password text box and remember me box
                        const SizedBox(height: 10,),
                          const Padding(padding: EdgeInsets.only(top: 40,left: 20),
                          
                          child: Text("Remember me",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), )
                          
                        ),
                        
                        const SizedBox(height: 10,),
                        //login button
                        
                        SizedBox(
                          height: 50,
                          width: 150,
                          
                          child: ElevatedButton(
                          onPressed: (){Navigator.pushNamed(context, "/test");},
                          /*color: AppColors.part_dark,*/
                          
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(36))),
                            //padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.only(left: 200)),
                            ),
                          child: const Text("Login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                          

                        ),
                          ),
                   
                        const SizedBox(height: 20,),
                        //register instead
                        Row(
                          children:  <Widget>[
                             const Text("Don't have an account? ",style: TextStyle(fontSize: 18),),
                             TextButton(onPressed: () {}, 
                             child: Text("Register instead", style: TextStyle(fontSize: 20,color: AppThemeChoose.getMode(context)? AppColors.part_dark: AppColors.part_light,))
                             )
                          ],
                        )
                      ],
                    ),
                    ),
              ),
              
              )
            ]
          ),
        ),
      );
  }
  
}






