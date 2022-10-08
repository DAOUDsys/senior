part of '../../utils/imports/app_imports.dart';

class ModelStaff {
  String? name;
  String? image;
  


  ModelStaff({
    this.name,
    this.image,
  });

  ModelStaff.fromJson(Map<String,dynamic> json) : assert(json.isNotEmpty),
    name = json['name'],
    image = json['image'];
  
  Map<String,dynamic> toJson() {
    final Map<String,dynamic> data = <String,dynamic>{} ;
    data['name'] =name;
    data['image'] =image;

    return data;
  }

}