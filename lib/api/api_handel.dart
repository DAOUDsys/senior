part of '../utils/imports/app_imports.dart';

abstract class ApiHandel {

  // get shelves data from api and store it in the phone
  Future<ModelShelfList?> getShelf(BuildContext context);
}