part of '../utils/imports/app_imports.dart';

class API extends ApiHandel {
  final int timeOut = 100;
  @override
  // get shelves data from api and store it in the phone
  Future<ModelShelfList?> getShelf(BuildContext context) async{
    // req GET
    Uri url= Uri.parse("");
    http.Response res = await http.get(url).timeout(Duration(seconds: timeOut));

    ModelShelfList? dataModel;

    if(res.statusCode == 200) {
      // 200 == success 
      // https://miro.medium.com/max/920/1*w_iicbG7L3xEQTArjHUS6g.jpeg

      // the jsonDecode covert the string file that will reserved to readable json file(بفك الضغط)
      Map<String,dynamic> json = convert.jsonDecode(res.body);
      dataModel = ModelShelfList.fromJson(json);
    }
    else {
      // failed // error
      dataModel = null;
      CustomToast.toastLess("An error occurred while fetching the data");
    }
    return dataModel;
  }
}