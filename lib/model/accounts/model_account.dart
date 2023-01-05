part of '../../utils/imports/app_imports.dart';

class ModelAccount {
  String? id;
  String? name;
  String? password;
  String? email;
  String? userType;
  dynamic ownerId;

  ModelAccount({
    this.id = '',
    this.name = '',
    this.password,
    this.email = '',
    this.userType = '',
    this.ownerId,
  });

  setId(String? id) => this.id = id;
  setEmail(String? email) => this.email = email;
  setPass(String? password) => this.password = password;
  setName(String? name) => this.name = name;
  setType(String? userType) => this.userType = userType;
  setOwnerId(ownerId) => this.ownerId = ownerId;

  ModelAccount.fromSnapshot(snapshot)
      : name = snapshot.data()['name'],
        email = snapshot.data()['email'],
        userType = snapshot.data()['type'],
        ownerId = snapshot.data()['ownerId'];

  @override
  String toString() =>
      'ModelUser (ID: $id , email: $email , password: $password , name: $name , user type: $userType, ownerId: ${ownerId.toString()})';
}
