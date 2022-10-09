part of '../../utils/imports/app_imports.dart';

class ModelStaffList {

  List<ModelStaff>? staff;

  ModelStaffList({this.staff});

  ModelStaffList.fromJson(Map<String,dynamic> json) 
    :assert(json['staffs'] != null) {
      // initialize the list
      staff = <ModelStaff> [];
      // get the data from json to our model
      json['staffs'].forEach((person) {
        staff!.add(ModelStaff.fromJson(person));
      });
    }
    
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic> {};
    if(staff != null) {
      data['staffs'] = staff!.map((person) => person.toJson()).toList(); 
    }
    return data;
  } 
    
  
}