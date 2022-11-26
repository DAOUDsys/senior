part of '../../utils/imports/app_imports.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);

  static final GlobalKey<FormState> keyFrom = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Register auth = Provider.of<Register>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          elevation: 0,
          title: const Text(
            "Change password",
            style: TextStyle(fontSize: 28),
          ),
          centerTitle: true,
        ),
      ),
      // scaffold color is the same as appbar to let it seem like curves and the container has the opposite color
      backgroundColor: AppThemeChoose.getMode(context)
          ? AppColors.part_dark
          : AppColors.part_light,
      //container that have the grid inside it and its the body
      body: Container(
        //decoration of the main container
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(36), topRight: Radius.circular(36)),
          color: AppThemeChoose.getMode(context)
              ? AppColors.main_dark
              : AppColors.main_light,
        ),

        //child of the main container
        child: Padding(
          padding: const EdgeInsets.only(top: 90),
          child: Center(
              // container that contain the textfield
              child: Container(
            width: 380,
            height: 300,
            decoration: BoxDecoration(
              color: AppThemeChoose.getMode(context)
                  ? AppColors.textbox_dark
                  : AppColors.textbox_light,
              boxShadow: [
                BoxShadow(
                    color: AppColors.shadow_textbox_dark,
                    blurRadius: AppThemeChoose.getMode(context) ? 50 : 30,
                    offset: const Offset(0, 10))
              ],
              borderRadius: BorderRadius.circular(36),
            ),
            ///////////////// the form is here /////////////////////
            child: Form(
              key: keyFrom,
              child: Column(
                // to make space between column components
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Enter your email",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // size box to set width for text filed
                  Container(
                      width: 300,
                      height: 70,
                      decoration: BoxDecoration(
                          color: AppThemeChoose.getMode(context)
                              ? AppColors.textbox_dark
                              : AppColors.textbox_light,
                          borderRadius: BorderRadius.circular(36),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.shadow_textbox_dark,
                                blurRadius:
                                    AppThemeChoose.getMode(context) ? 50 : 30,
                                offset: const Offset(0, 10))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                          showCursor: false,
                          autofocus: true,
                          validator: AppValidators.isEmail,
                          onChanged: ((value) => auth.verifyEmail(value)),
                          decoration: const InputDecoration(
                            hintText: "  Email",
                            border: InputBorder.none,
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 50)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 50)),
                          ),
                        ),
                      )),
                  Column(children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(300, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        onPressed: () async {
                          if (keyFrom.currentState?.validate() ?? false) {
                            dev.log(auth.verifiedEmail!);
                            if (await auth.resetPassword) {
                              CustomToast.toast("Reset password send to your email", context);
                              Navigator.pop(context);
                            } else {
                              CustomToast.toast(auth.errorMessage, context);
                            }
                          }
                        },
                        child: const Text(
                          "send verify code",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )),
                    TextButton(
                        onPressed: () {
                          // auth.reset();
                          Navigator.pop(context);
                        },
                        child: Text("Already have account",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppThemeChoose.getMode(context)
                                  ? AppColors.part_dark
                                  : AppColors.part_light,
                            )))
                  ])
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
