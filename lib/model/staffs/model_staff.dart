part of '../../utils/imports/app_imports.dart';

class ModelStaff {
  String? name;
  String? image;
  String? id;
  


  ModelStaff({
    this.name,
    this.image,
    this.id,
  });

  ModelStaff.fromJson(Map<String,dynamic> json) : assert(json.isNotEmpty),
    name = json['name'],
    image = json['image'],
    id = json['id'];
  
  Map<String,dynamic> toJson() {
    final Map<String,dynamic> data = <String,dynamic>{} ;
    data['name'] =name;
    data['id'] =id;
    data['image'] =image;

    return data;
  }

}