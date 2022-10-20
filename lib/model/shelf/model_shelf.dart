part of '../../utils/imports/app_imports.dart';

class ModelShelf {
  
  // parameters
  String? id;
  String? name;
  String? weight;
  String? expireDate;
  String? price;
  String? location;

  // constructor
  ModelShelf({
    this.id,
    this.name,
    this.price,
    this.weight,
    this.expireDate,
    this.location,
  });
  
  ModelShelf.fromJson(Map<String,dynamic> json) : assert(json.isNotEmpty),
    id = json['id'],
    name = json['name'],
    price = json['price'],
    weight = json['weight'],
    expireDate = json['expireDate'],
    location = json['location'];
  
  Map<String,dynamic> toJson() {
    final Map<String,dynamic> data = <String,dynamic>{} ;
    data['id'] =id;
    data['name'] =name;
    data['price'] =price;
    data['weight'] =weight;
    data['expireDate'] =expireDate;
    data['location'] =location;

    return data;
  }

}