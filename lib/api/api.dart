part of '../utils/imports/app_imports.dart';

class API extends ApiHandel {
  final int timeOut = 100;

  // ********************************** shelf **************************************
  // get shelves data from api and store it in the phone
  @override
  Future<ModelShelfList?> getShelf() async{
    try{
    // req GET
    // https://api.npoint.io/815ad3ffcf8efc5560fd
    Uri url= Uri.parse("https://api.npoint.io/815ad3ffcf8efc5560fd"); 
    http.Response res = await http.get(url).timeout(Duration(seconds: timeOut));
    ModelShelfList? dataModel;


    if(res.statusCode == 200) {
      // 200 == success 
      // https://miro.medium.com/max/920/1*w_iicbG7L3xEQTArjHUS6g.jpeg
      // the jsonDecode covert the string file that will reserved to readable json file(بفك الضغط)
      Map<String,dynamic> json = convert.jsonDecode(res.body);
      dataModel = ModelShelfList.fromJson(json);
      // dev.log("dataModel for shelf is loaded");
    }
    else {
      // failed // error
      dataModel = null;
      CustomToast.toastLess("An error occurred while fetching the data");
      // dev.log("state code == error");
    }
    return dataModel;
    }
    catch(error) {
      dev.log("error while get shelf data");
    }
    return null;
  }


  // ********************************** staff **************************************
  // get staffs data from api and store it in the phone
  @override
  Future<ModelStaffList?> getStaff() async{
    try {
    // req GET
    // https://api.npoint.io/e5541936db5f86f3ffcf
    Uri url= Uri.parse("https://api.npoint.io/e5541936db5f86f3ffcf");
    http.Response res = await http.get(url).timeout(Duration(seconds: timeOut));

    ModelStaffList? dataModel;

    if(res.statusCode == 200) {
      // 200 == success 
      // https://miro.medium.com/max/920/1*w_iicbG7L3xEQTArjHUS6g.jpeg

      // the jsonDecode covert the string file that will reserved to readable json file(بفك الضغط)
      Map<String,dynamic> json = convert.jsonDecode(res.body);
      dataModel = ModelStaffList.fromJson(json);
    }
    else {
      // failed // error
      dataModel = null;
      CustomToast.toastLess("An error occurred while fetching the data");
    }
    return dataModel;
    }
    catch(error) {
      dev.log("error while get staff data");
    }
    return null;
  }



  // ********************************** notification **************************************
  @override
  Future<ModelNotificationList?> getNotification() async{
    try{
    // req GET
    // https://api.npoint.io/497b7c965a17b91d9167
    Uri url= Uri.parse("https://api.npoint.io/497b7c965a17b91d9167");
    http.Response res = await http.get(url).timeout(Duration(seconds: timeOut));

    ModelNotificationList? dataModel;

    if(res.statusCode == 200) {
      // 200 == success 
      // https://miro.medium.com/max/920/1*w_iicbG7L3xEQTArjHUS6g.jpeg

      // the jsonDecode covert the string file that will reserved to readable json file(بفك الضغط)
      Map<String,dynamic> json = convert.jsonDecode(res.body);
      dataModel = ModelNotificationList.fromJson(json);
    }
    else {
      // failed // error
      dataModel = null;
      CustomToast.toastLess("An error occurred while fetching the data");
    }
    return dataModel;
    }
    catch(error) {
      dev.log("error while get notification data");
    }
    return null;
  }
}