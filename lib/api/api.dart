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
              load: data[i]['load']));
        }
        shelfModel.shelf = dataModel;
      } else {
        // failed // error
        shelfModel = null;
        CustomToast.toastLess("An error occurred while fetching shelves data");
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
    await getData();
    var data;
    try {
      final dbRef = referenceDatabase.child(userId).child("notifications");
      await dbRef.once().then((DatabaseEvent databaseEvent) async {
        // data is the all notification data we got from realtime database as a list of objects
        data = databaseEvent.snapshot.value;
      });
      List decodedData;
      List<ModelNotification> dataModel = <ModelNotification>[];
      ModelNotificationList? notificationModel = ModelNotificationList();
      if (data != null) {
        var x = Map<String, dynamic>.from(data);
        decodedData = x.entries.map((entry) => entry.value).toList();
        // we but all data as list of shelf models
        for (int i = 0; i < decodedData.length; i++) {
          dataModel.add(ModelNotification(
              content: decodedData[i]['content'],
              timeStamp: DateTime.fromMillisecondsSinceEpoch(
                      int.parse(decodedData[i]['timeStamp']) * 1000)
                  .toString()));
        }
        dataModel.sort((a, b) => b.timeStamp!.compareTo(a.timeStamp!));
        notificationModel.notification = dataModel;
      } else {
        // failed // error
        notificationModel = null;
        CustomToast.toastLess(
            "An error occurred while fetching notification data");
        // dev.log("state code == error");
      }

      return notificationModel;
    } catch (error) {
      dev.log("error while get notification data");
    }
    return null;
  }

  // ********************************** analytics **************************************
  @override
  Future<String?> getAnalytics(int day, int month, int item) async {
    int index = 0;
    String? result;
    try {
      index += item * 90 + day - 1;
      if (month == 2) {
        index += 31;
      }
      if (month == 3) {
        index += 59;
      }
      dev.log(index.toString());
      // req GET
      Uri url =
          Uri.parse("https://api.npoint.io/f856655a5cebf6c55a72/$index/sales");
      http.Response res =
          await http.get(url).timeout(Duration(seconds: timeOut));

// 45000 object
// 900 object for each item
// 50 item
//
//       {
//   "month":1,
//   "dayofmonth":1,
//   "item_name":"pancake mix",
//   "sales":12.886522
//  },

      if (res.statusCode == 200) {
        // the jsonDecode covert the string file that will reserved to readable json file(بفك الضغط)
        result = res.body.split(".")[0];
      } else {
        // failed // error
        result = "no data available";
        CustomToast.toastLess("An error occurred while fetching the data");
      }
      return result; // here return what you want
    } catch (error) {
      dev.log("error while get analytics data data");
    }
    return "error while get data";
  }
}
