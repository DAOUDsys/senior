// ignore_for_file: use_build_context_synchronously

part of '../../utils/imports/app_imports.dart';

class NewAccount extends StatefulWidget {
  const NewAccount({Key? key}) : super(key: key);

  @override
  State<NewAccount> createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
  String? firstValue;
  String? secondValue;
  String? thisEmail;
  String? thisName;

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
    final Register auth = Provider.of<Register>(context);
    final FirebaseAuth currentUser = FirebaseAuth.instance;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            elevation: 0,
            title: const Text(
              "Sign up",
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

        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height - 120,
                //decoration of the main container
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(36),
                      topRight: Radius.circular(36)),
                  color: AppThemeChoose.getMode(context)
                      ? AppColors.main_dark
                      : AppColors.main_light,
                ),

                //child of the main container
                //  child: Padding(padding: const EdgeInsets.only(top: 30),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 10, right: 10),
                  ///////////////// the form is here /////////////////////
                  child: Form(
                    key: keyFrom,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "Create new account",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Name",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w400),
                              ),
                              MyTextField(
                                height: 70,
                                width: 250,
                                prefixIcon: const Icon(Icons.person),
                                onChanged: (value) => thisName = value,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Email",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w400),
                              ),
                              MyTextField(
                                height: 70,
                                width: 250,
                                prefixIcon: const Icon(Icons.email),
                                type: TextInputType.emailAddress,
                                validError: AppValidators.isEmail,
                                onChanged: (value) => thisEmail = value,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Password",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w400),
                              ),
                              MyTextField(
                                height: 70,
                                width: 250,
                                prefixIcon: const Icon(Icons.key),
                                ispassword: auth.isShown,
                                postIcon: auth.iconEye,
                                onPostIcon: () {
                                  auth.changeIconShow(auth.isShown);
                                },
                                onChanged: (value) => secondValue = value,
                                validError: AppValidators.isPass,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Password",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w400),
                              ),
                              MyTextField(
                                height: 70,
                                width: 250,
                                prefixIcon: const Icon(Icons.key),
                                ispassword: auth.isShown,
                                postIcon: auth.iconEye,
                                onPostIcon: () {
                                  auth.changeIconShow(auth.isShown);
                                },
                                validError: (value) =>
                                    AppValidators.isEqualPass(
                                        value, secondValue),
                                onChanged: (value) => firstValue = value,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "User type",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w400),
                              ),
                              Container(
                                width: 250,
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
                                              AppThemeChoose.getMode(context)
                                                  ? 50
                                                  : 30,
                                          offset: const Offset(0, 10))
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 10),
                                  child: DropdownButton(
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
                                        dropDownValue = newValue!;
                                      });
                                    },
                                    // the color of the arrow
                                    iconEnabledColor:
                                        AppThemeChoose.getMode(context)
                                            ? AppColors.part_dark
                                            : AppColors.part_light,
                                    // size of the arrow
                                    iconSize: 40,
                                    // to let it fill the container
                                    isExpanded: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 200),
                              child: auth.loading
                                  ? const AppLoading(
                                      loading: ChoiceLoading.button,
                                    )
                                  : ElevatedButton(
                                      onPressed: () async {
                                        if (keyFrom.currentState?.validate() ??
                                            false) {
                                          auth.newUser.setPass(firstValue);
                                          auth.newUser.setEmail(thisEmail);
                                          auth.newUser.setName(thisName);
                                          auth.newUser.setType(dropDownValue);

                                          keyFrom.currentState?.save();
                                          final json = {
                                            'name': thisName,
                                            'type': dropDownValue,
                                            'email': thisEmail,
                                            'ownerId': '',
                                          };

                                          // ignore: duplicate_ignore
                                          if (await auth.authSignIn(
                                                  singin: false) !=
                                              null) {
                                            // auth.reset();
                                            auth.userData.setPass(firstValue);
                                            auth.userData.setEmail(thisEmail);
                                            auth.userData.setName(thisName);
                                            auth.userData.setType(dropDownValue);

                                            final docUser = FirebaseFirestore
                                                .instance
                                                .collection("users")
                                                .doc(currentUser
                                                    .currentUser!.uid);
                                            await docUser.set(json);

                                            if (dropDownValue == 'Owner') {
                                              final docShelf = FirebaseFirestore
                                                  .instance
                                                  .collection("shelves")
                                                  .doc(currentUser
                                                      .currentUser!.uid);
                                              await docShelf.set(json);
                                              Navigator.pushNamedAndRemoveUntil(
                                                  context,
                                                  "/shelves",
                                                  (route) => false);
                                            } else {
                                              Navigator.pushNamedAndRemoveUntil(
                                                  context,
                                                  "/connect",
                                                  (route) => false);
                                            }
                                            

                                            CustomToast.toast(
                                                "your account is created",
                                                context);
                                          } else {
                                            CustomToast.toast(
                                                auth.errorMessage, context);
                                            dev.log(auth.errorMessage);
                                          }
                                        } else {
                                          dev.log("error while sign up");
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(150, 65),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                      ),
                                      child: const Text(
                                        "Create",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ))
                        ]),
                  ),
                ))));
  }
}
