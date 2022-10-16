part of '../../imports/app_imports.dart';

class ModelShelvesDB {

  // parameters
  String? id;
  String? name;
  String? weight;
  String? expireDate;
  String? price;

  // constructor
  ModelShelvesDB({
    this.id,
    this.name,
    this.price,
    this.weight,
    this.expireDate,
  });
  
  ModelShelvesDB.fromMap({required Map<String,dynamic> map}) : assert(map.isNotEmpty),
    id = map['id'],
    name = map['name'],
    price = map['price'],
    weight = map['weight'],
    expireDate = map['expireDate'];
  
  Map<String,dynamic> toMap() {
    final Map<String,dynamic> data = <String,dynamic>{} ;
    data['id'] =id;
    data['name'] =name;
    data['price'] =price;
    data['weight'] =weight;
    data['expireDate'] =expireDate;

    return data;
  }

}