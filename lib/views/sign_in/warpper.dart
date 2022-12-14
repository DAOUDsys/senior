part of '../../utils/imports/app_imports.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///[Register] is the authController class
    return StreamBuilder<User?>(
        stream: Register().userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const AppLoading(loading: ChoiceLoading.page);
          }

          if (snapshot.hasData) {
            final FirebaseController currentUserData =
                Provider.of<FirebaseController>(context);
            currentUserData.performUserData();
            if (currentUserData.connected == '') {
              return const Connect();
            }
            return const ShelfList();
          } else {
            return SingIn();
          }
        });
  }
}
