part of '../../utils/imports/app_imports.dart';

// *********************** Icon Eye **************************
class AuthController extends ChangeNotifier {
  bool isShown = true;
  IconData iconEye = AppIcons.showPass;

  void changeIconShow(bool value) {
    if(value) {
      iconEye = AppIcons.noShowPass;
      isShown = false;
    }
    else {
      iconEye = AppIcons.showPass;
      isShown = true;
    }
    notifyListeners();
  }
}