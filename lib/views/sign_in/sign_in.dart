part of '../../utils/imports/app_imports.dart';

// ignore: use_key_in_widget_constructors
class SingIn extends StatelessWidget {
  // global key for form
  static final GlobalKey<FormState> keyFrom = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Register auth = Provider.of<Register>(context);
    final FirebaseAuth user = FirebaseAuth.instance;
    final FirebaseController currentUserData = Provider.of<FirebaseController>(context);

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        //height to let container cover its space to let the SingleChildScrollView work well
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 55),
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          const SizedBox(
            height: 35,
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Welcome back",
                      style: TextStyle(
                          color: AppColors.white_dark,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Login to get started",
                      style: TextStyle(
                        color: AppColors.white_dark,
                        fontSize: 25,
                      ),
                    ),
                  ])),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppThemeChoose.getMode(context)
                    ? AppColors.main_dark
                    : AppColors.main_light,

                ///color of expanded
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadow_textbox_dark,
                    blurRadius: 50,
                  )
                ],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                ///////////////// the form is here /////////////////////
                child: Form(
                  key: keyFrom,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 40,
                          left: 30,
                        ),
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // padding between login text and password text box
                      const SizedBox(
                        height: 70,
                      ),
                      //Container for user name text box

                      MyTextField(
                        width: 400, height: 70,
                        prefixIcon: const Icon(
                          Icons.person,
                          size: 25,
                        ),
                        hint: "User name",
                        validError: AppValidators.isEmail,
                        // on save take string and set email take a string so we should not send there data to each other (like the next text filed)
                        // the compiler will do that automatically
                        onSaved: auth.userData.setEmail,
                      ),

                      const SizedBox(height: 25),

                      //Container for password text box
                      MyTextField(
                        width: 400,
                        height: 70,
                        prefixIcon: const Icon(
                          Icons.key,
                          size: 25,
                        ),
                        hint: "Password",
                        ispassword: auth.isShown,
                        postIcon: auth.iconEye,
                        onPostIcon: () {
                          auth.changeIconShow(auth.isShown);
                        },
                        validError: AppValidators.isPass,
                        onSaved: (value) => auth.userData.setPass(value),
                      ),

                      //padding between password text box and remember me box
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 10),
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/verifyCode");
                            },
                            child: const Text(
                              "Forget password?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  decoration: TextDecoration.underline),
                            )),
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      //login button

                      SizedBox(
                        height: 60,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (keyFrom.currentState?.validate() ?? false) {
                              keyFrom.currentState!.save();
                              if (await auth.authSignIn(singin: true) != null) {
                                // auth.reset();
                                currentUserData.performUserData(user.currentUser!.uid);
                                Navigator.pushNamedAndRemoveUntil(
                                    context, "/shelves", (route) => false);
                              } else {
                                CustomToast.toast(auth.errorMessage, context);
                              }
                            }

                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      //register instead
                      Row(
                        children: <Widget>[
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(fontSize: 18),
                          ),
                          TextButton(
                              onPressed: () {
                                // auth.reset();
                                Navigator.pushNamed(context, "/newaccount");
                              },
                              child: Text("Register instead",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: AppThemeChoose.getMode(context)
                                        ? AppColors.part_dark
                                        : AppColors.part_light,
                                  )))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    ));
  }
}
