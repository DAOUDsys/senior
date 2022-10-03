part of '../../utils/imports/app_imports.dart';

class ModelAccount {
  String? firstName;
  String? lastName;
  String? password;
  String? image;
  String? phone;
  String? email;
  bool? useType;


  ModelAccount({
    this.firstName,
    this.lastName,
    this.password,
    this.image,
    this.phone,
    this.email,
    this.useType,
  });

  ModelAccount.fromJson(Map<String,dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    password = json['password'];
    image = json['image'];
    phone = json['phone'];
    email = json['email'];
    useType = json['useType'];
  }


}