part of '../../utils/imports/app_imports.dart';

class ModelAccount {
  String? id;
  String? firstName;
  String? lastName;
  String? password;
  String? image;
  String? phone;
  String? email;
  bool? useType;


  ModelAccount({
    this.id,
    this.firstName,
    this.lastName,
    this.password,
    this.image,
    this.phone,
    this.email,
    this.useType,
  });

  ModelAccount.fromJson(Map<String,dynamic> json) : assert(json.isNotEmpty),
    id=json['id'],
    firstName = json['firstName'],
    lastName = json['lastName'],
    password = json['password'],
    image = json['image'],
    phone = json['phone'],
    email = json['email'],
    useType = json['useType'];
  
  Map<String,dynamic> toJson() {
    final Map<String,dynamic> data = <String,dynamic>{} ;
    data['id'] =id;
    data['firstName'] =firstName;
    data['lastName'] =lastName;
    data['password'] =password;
    data['image'] =image;
    data['phone'] =phone;
    data['email'] =email;
    data['useType'] =useType;

    return data;
  }

}