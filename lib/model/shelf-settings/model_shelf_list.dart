part of '../../utils/imports/app_imports.dart';

class ModelShelfList {

  List<ModelShelf>? shelf;

  ModelShelfList({this.shelf});

  ModelShelfList.fromJson(Map<String,dynamic> json) 
    :assert(json['shelf'] != null) {
      // initialize the list
      shelf = <ModelShelf> [];
      // get the data from json to our model
      json['shelf'].forEach((x) {
        shelf!.add(ModelShelf.fromJson(x));
      });
    }
    
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic> {};
    if(shelf != null) {
      data['shelf'] = shelf!.map((x) => x.toJson()).toList(); 
    }
    return data;
  } 
    
  
}