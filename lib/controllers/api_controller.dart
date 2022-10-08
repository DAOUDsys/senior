part of '../../utils/imports/app_imports.dart';

class ControllerApi extends ChangeNotifier {
  bool loading = false;
  ModelShelfList? shelfData;

  Future fetchShelfData(BuildContext context) async {
    loading = true;
    shelfData = await API().getShelf(context);
    loading = false;
    notifyListeners();
  }
}