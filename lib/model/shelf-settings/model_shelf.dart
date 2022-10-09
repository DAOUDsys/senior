part of '../../utils/imports/app_imports.dart';

class ModelShelf {
  
  // parameters
  String? id;
  String? shelfName;
  String? productName;
  double? weight;
  String? expireDate;
  double? price;

  // constructor
  ModelShelf({
    this.id,
    this.shelfName,
    this.productName,
    this.price,
    this.weight,
    this.expireDate,
  });
  
  ModelShelf.fromJson(Map<String,dynamic> json) : assert(json.isNotEmpty),
    id = json['id'],
    shelfName = json['shelfName'],
    productName = json['productName'],
    price = json['price'],
    weight = json['weight'],
    expireDate = json['expireDate'];
  
  Map<String,dynamic> toJson() {
    final Map<String,dynamic> data = <String,dynamic>{} ;
    data['id'] =id;
    data['shelfName'] =shelfName;
    data['productName'] =productName;
    data['price'] =price;
    data['weight'] =weight;
    data['expireDate'] =expireDate;

    return data;
  }

}