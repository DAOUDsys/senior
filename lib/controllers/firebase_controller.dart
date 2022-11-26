part of '../../utils/imports/app_imports.dart';

class FirebaseController extends ChangeNotifier {
  
  ModelAccount registeredUser = ModelAccount();
  String connected = '';
  

  // final FirebaseAuth user = FirebaseAuth.instance;

  getData(x,uid) async {
    String target = '';
    // String uid = user.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((snapshot) => {
          target = snapshot[x]
          });

          return target;
          
  }

  cc() {
    if(connected != '') {
      notifyListeners();
    }
  }

  performUserData(uid) async {
        await getData('ownerId', uid).then((x) => connected = x);
        await getData('name',uid).then((x) => registeredUser.setName(x));
        await getData('email', uid).then((x) => registeredUser.setEmail(x));
        await getData('type', uid).then((x) => registeredUser.setType(x));
        await getData('ownerId', uid).then((x) => registeredUser.setOwnerId(x));
        registeredUser.setId(uid);  
        cc();

  }


}
