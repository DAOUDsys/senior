part of '../../utils/imports/app_imports.dart';

class ModelShelf {
  
  // parameters
  String? id;
  String? name;
  String? weight;
  String? expireDate;
  String? price;
  String? location;
  String? load;


  // constructor
  ModelShelf({
    this.id,
    this.name,
    this.price,
    this.weight,
    this.expireDate,
    this.location,
    this.load,
  });
  
  ModelShelf.fromJson(Map<String,dynamic> json) : assert(json.isNotEmpty),
    id = json['id'],
    name = json['name'],
    price = json['price'],
    weight = json['weight'],
    expireDate = json['expireDate'],
    location = json['location'],
    load = json['load'];
  
  Map<String,dynamic> toJson() {
    final Map<String,dynamic> data = <String,dynamic>{} ;
    data['id'] =id;
    data['name'] =name;
    data['price'] =price;
    data['weight'] =weight;
    data['expireDate'] =expireDate;
    data['location'] =location;
    data['load'] =load;


    return data;
  }

  void toStrings() {
    dev.log('id: $id, name: $name, price: $price, weight: $weight, expire date: $expireDate, location: $location, load: $load');
  }
}