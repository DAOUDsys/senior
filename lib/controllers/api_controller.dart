part of '../../utils/imports/app_imports.dart';

class ControllerApi extends ChangeNotifier {
  bool loading = false;
  ModelShelfList? shelfData;
  ModelStaffList? staffData;
  ModelNotificationList? notificationData;
  String? analyticsData;

  /// [changeLoadingValue] to notify that the loading value changed
  set changeLoadingValue(bool value) {
    loading = value;
    notifyListeners();
  }

  // ******************* Shelf **********************
  Future<void> fetchShelfData() async {
    changeLoadingValue = true;
    shelfData = await API().getShelf();
    changeLoadingValue = false;
    notifyListeners();
  }

  // ******************* Staff **********************
  /// [fetchStaffData] fetch data from compressed json file and convert it as model
  Future<void> fetchStaffData() async {
    changeLoadingValue = true;
    staffData = await API().getStaff();
    changeLoadingValue = false;
    notifyListeners();
  }

  // ******************* notification **********************
  /// [fetchStaffData] fetch data from compressed json file and convert it as model
  Future<void> fetchNotificationData() async {
    changeLoadingValue = true;
    notificationData = await API().getNotification();
    changeLoadingValue = false;
    notifyListeners();
  }

  // ******************* Analytics **********************
  /// [fetchStaffData] fetch data from compressed json file and convert it as model
  Future<void> fetchAnalytics(int day, int month, int item) async {
    changeLoadingValue = true;
    analyticsData = await API().getAnalytics(day, month, item);
    changeLoadingValue = false;
    notifyListeners();
  }
}
