part of '../utils/imports/app_imports.dart';

class API extends ApiHandel {
  final int timeOut = 100;

  final referenceDatabase = FirebaseDatabase.instance.ref();
  String userId = '';
  String userType = '';
  String uid = FirebaseAuth.instance.currentUser!.uid;
  getData() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((snapshot) => {userType = snapshot['type']});
    if (userType == 'Owner') {
      userId = FirebaseAuth.instance.currentUser!.uid;
    } else {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get()
          .then((snapshot) => {userId = snapshot['ownerId']});
    }
  }

  // ********************************** shelf **************************************
  // get shelves data from api and store it in the phone
  @override
  Future<ModelShelfList?> getShelf() async {
    await getData();
    int count = 0;
    var data;
    try {
      await referenceDatabase
          .child(userId)
          .child("count")
          .once()
          .then((DatabaseEvent databaseEvent) async {
        count = int.parse(databaseEvent.snapshot.value.toString());
      });
      final dbRef = referenceDatabase.child(userId).child("shelves");
      await dbRef.once().then((DatabaseEvent databaseEvent) async {
        // data is the all shelf data we got from realtime database as a list of objects
        data = databaseEvent.snapshot.value;
      });

      List<ModelShelf> dataModel = <ModelShelf>[];
      ModelShelfList? shelfModel = ModelShelfList();
      if (data != null) {
        // we but all data as list of shelf models
        for (int i = 0; i < count; i++) {
          dataModel.add(ModelShelf(
            id: data[i]['id'],
            name: data[i]['name'],
            price: data[i]['price'],
            weight: data[i]['weight'],
            expireDate: data[i]['expireDate'],
            location: data[i]['location'],
          ));
        }
        shelfModel.shelf = dataModel;
      } else {
        // failed // error
        shelfModel = null;
        CustomToast.toastLess("An error occurred while fetching the data");
        // dev.log("state code == error");
      }
      return shelfModel;
    } catch (error) {
      dev.log("error while get shelf data");
    }
    return null;
  }

  // ********************************** staff **************************************
  // get staffs data from api and store it in the phone
  @override
  Future<ModelStaffList?> getStaff() async {
    try {
      List<dynamic> target = [];
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get()
          .then((snapshot) => {target = snapshot['ownerId']});
      List<ModelStaff> staffData = <ModelStaff>[];
      ModelStaffList? dataModel = ModelStaffList();

      if (target != []) {
        for (int i = 0; i < target.length; i++) {
          staffData
              .add(ModelStaff(name: target[i]['name'], id: target[i]['id']));
        }
        dataModel.staff = staffData;
      } else {
        // failed // error
        dataModel = null;
        CustomToast.toastLess("An error occurred while fetching the data");
      }
      return dataModel;
    } catch (error) {
      dev.log("error while get staff data");
    }
    return null;
  }

  // ********************************** notification **************************************
  @override
  Future<ModelNotificationList?> getNotification() async {
    try {
      // req GET
      // https://api.npoint.io/497b7c965a17b91d9167
      Uri url = Uri.parse("https://api.npoint.io/497b7c965a17b91d9167");
      http.Response res =
          await http.get(url).timeout(Duration(seconds: timeOut));

      ModelNotificationList? dataModel;

      if (res.statusCode == 200) {
        // 200 == success
        // https://miro.medium.com/max/920/1*w_iicbG7L3xEQTArjHUS6g.jpeg

        // the jsonDecode covert the string file that will reserved to readable json file(بفك الضغط)
        Map<String, dynamic> json = convert.jsonDecode(res.body);
        dataModel = ModelNotificationList.fromJson(json);
      } else {
        // failed // error
        dataModel = null;
        CustomToast.toastLess("An error occurred while fetching the data");
      }
      return dataModel;
    } catch (error) {
      dev.log("error while get notification data");
    }
    return null;
  }
}
