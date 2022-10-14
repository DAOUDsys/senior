part of '../../utils/imports/app_imports.dart';

// *********************** Icon Eye **************************
class Register extends ChangeNotifier {
  bool isShown = true;
  IconData iconEye = AppIcons.noShowPass;
  String? verifiedEmail;

  void changeIconShow(bool value) {
    if(value) {
      iconEye = AppIcons.showPass;
      isShown = false;
    }
    else {
      iconEye = AppIcons.noShowPass;
      isShown = true;
    }
    notifyListeners();
  }
  // *********************** verify Email **************************
  void verifyEmail(String? value) {
    verifiedEmail = value;
    notifyListeners();
  }

  ModelAccount userData = ModelAccount();
  ModelAccount newUser = ModelAccount();

  reset() {
    userData = ModelAccount();
    notifyListeners();
  }


  // *********************** Auth Services **************************
  // to check if the data still coming from firebase
  bool loading = false;
  String errorMessage = '';

  /// [changeLoadingValue] to notify that the loading value changed
  set changeLoadingValue(bool value) {
    loading = value;
    notifyListeners();
  }

  /// [setErrorMessage] to save the error that happens
  set setErrorMessage(String value) {
    errorMessage = value;
    notifyListeners();
  }

  
  // *********************** SignUp or SignIn **************************
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  /// [singin] to check if if the user want to sing in or create a new account
  /// [authSignIn] the method used to sign in or create account in firebase and check validity of data
  Future<User?> authSignIn({bool singin = false}) async {
    try {
      changeLoadingValue = true;
      // ignore: unused_local_variable
      // this method return user that have sign up
      UserCredential authResult = singin? 
      await firebaseAuth.signInWithEmailAndPassword(email: userData.email!, password: userData.password!):
      await firebaseAuth.createUserWithEmailAndPassword(email: newUser.email!, password: newUser.password!);

        late User user; 
        if(authResult.user?.uid.isNotEmpty ?? false) {
          user = authResult.user!;
          changeLoadingValue = false;
        }
        return user;
    } on SocketException {
      changeLoadingValue = false;
      setErrorMessage = 'No internet connection';
      return null;
    } on FirebaseAuthException catch (error) {
      changeLoadingValue = false;
      setErrorMessage = error.message ?? '';
      return null;
    } catch(e) {
      changeLoadingValue = false;
      setErrorMessage =e.toString();
      return null;
      }
  }

  // *********************** reset password **************************
  Future<bool> get resetPassword async {
    try {
      changeLoadingValue = true;
      await firebaseAuth.sendPasswordResetEmail(email: verifiedEmail!);
      changeLoadingValue = false;
      return true;
    } on SocketException {
      changeLoadingValue = false;
      setErrorMessage = 'No internet connection';
      return false;
    } on FirebaseAuthException catch (error) {
      changeLoadingValue = false;
      setErrorMessage = error.message ?? '';
      return false;
    } catch(e) {
      changeLoadingValue = false;
      setErrorMessage =e.toString();
      return false;
      }
  }

  // *********************** Sign Out **************************
  Future<void>  signOut() async {
    await firebaseAuth.signOut();
  }

  // *********************** stream connection from firebase **************************
  Stream<User?> get userStream => firebaseAuth.authStateChanges();

}