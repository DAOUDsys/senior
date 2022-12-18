part of '../../utils/imports/app_imports.dart';

class FirebaseController extends ChangeNotifier {
  ModelAccount registeredUser = ModelAccount();
  ModelShelf currentShelf = ModelShelf();
  String connected = '';
  final FirebaseAuth user = FirebaseAuth.instance;
  final referenceDatabase = FirebaseDatabase.instance.ref();

  // final FirebaseAuth user = FirebaseAuth.instance;

  getData(x) async {
    String uid = user.currentUser!.uid;
    dynamic target;
    // String uid = user.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((snapshot) => {target = snapshot[x]});

    return target;
  }

  cc() {
    if (connected != '') {
      notifyListeners();
    }
  }

  performUserData() async {
    String uid = user.currentUser!.uid;
    await getData('name').then((x) => registeredUser.setName(x));
    await getData('email').then((x) => registeredUser.setEmail(x));
    await getData('type').then((x) => registeredUser.setType(x));
    if (registeredUser.userType == 'Employee') {
      await getData('ownerId').then((x) => connected = x);
    }
    await getData('ownerId').then((x) => registeredUser.setOwnerId(x));
    registeredUser.setId(uid);
    cc();
  }

  removeStaff(id) async {
    String uid = user.currentUser!.uid;
    var target;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((snapshot) => {target = snapshot['ownerId']});

    target.removeWhere((item) => item['id'] == id);

    final owner = FirebaseFirestore.instance.collection("users").doc(uid);
    owner.update({"ownerId": target});
    final staff = FirebaseFirestore.instance.collection("users").doc(id);
    staff.update({"ownerId": ''});
  }

  updateShelfData(sid, ModelShelf shelf) async {
    var data;
    int no = 0;
    final dbRef =
        referenceDatabase.child(user.currentUser!.uid).child("shelves");
    await dbRef.once().then((DatabaseEvent databaseEvent) {
      // data is the all shelf data we got from realtime database as a list of objects
      data = databaseEvent.snapshot.value;
    });
    dev.log(data.runtimeType.toString());
    for (int i = 0; i < data.length; i++) {
      if (data[i]['id'] == sid) {
        no = i;
      }
    }

    shelf.toStrings();
    await dbRef.child(no.toString()).update({
      'expireDate': shelf.expireDate,
      'location': shelf.location,
      'name': shelf.name,
      'price': shelf.price,
      'weight': shelf.weight,
      'load': shelf.load,
    });
  }
}
