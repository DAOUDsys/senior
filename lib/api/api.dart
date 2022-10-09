part of '../utils/imports/app_imports.dart';

class API extends ApiHandel {
  final int timeOut = 100;

  // ********************************** shelf **************************************
  // get shelves data from api and store it in the phone
  @override
  Future<ModelShelfList?> getShelf() async{
    // req GET
    // final String jsonString = await rootBundle.loadString('assets/db.json');

    // https://www.npoint.io/docs/d6e992a001ad483a9820
    Uri url= Uri.parse("https://api.npoint.io/d6e992a001ad483a9820"); ///////////////////
    http.Response res = await http.get(url).timeout(Duration(seconds: timeOut)); /////////////////
    ModelShelfList? dataModel;


    if(res.statusCode == 200) { ///////////////////
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


  // ********************************** staff **************************************
  // get staffs data from api and store it in the phone
  @override
  Future<ModelStaffList?> getStaff() async{
    // req GET
    Uri url= Uri.parse("");
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
  // ********************************** notification **************************************
  @override
  Future<ModelNotificationList?> getNotification() async{
    // req GET
    Uri url= Uri.parse("");
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
}