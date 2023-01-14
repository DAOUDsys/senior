part of '../utils/imports/app_imports.dart';

abstract class ApiHandel {
  // get shelves data from api and store it in the phone
  Future<ModelShelfList?> getShelf();
  Future<ModelStaffList?> getStaff();
  Future<ModelNotificationList?> getNotification();
  Future<String?> getAnalytics(int day, int month, int item);
}
