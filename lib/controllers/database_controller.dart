part of '../../utils/imports/app_imports.dart';

class ControllerDB extends ChangeNotifier {

  static String? currentId;

  Future<bool> installShelf (BuildContext context, ModelShelvesDB data) async {
    ModelShelvesDB? checkApp = await QueryShelves.db.getShelfById(data);

    if(checkApp == null) {
      if(await QueryShelves.db.insertShelf(data) > 0) {
        notifyListeners();
        return true;
      } else {
        CustomToast.toastLess("error download shelf data");
        return false;
      }
    } else {
      return false;
    } 
  }

  Future<ModelShelvesDB?> getShelfData (ModelShelvesDB data) async {
    return await QueryShelves.db.getShelfById(data);
  } 

}