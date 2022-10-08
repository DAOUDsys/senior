part of '../../utils/imports/app_imports.dart';

class ModeStaffList {

  List<ModelStaff>? staff;

  ModeStaffList({this.staff});

  ModeStaffList.fromJson(Map<String,dynamic> json) 
    :assert(json['staff'] != null) {
      // initialize the list
      staff = <ModelStaff> [];
      // get the data from json to our model
      json['staff'].forEach((person) {
        staff!.add(ModelStaff.fromJson(person));
      });
    }
    
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic> {};
    if(staff != null) {
      data['staff'] = staff!.map((person) => person.toJson()).toList(); 
    }
    return data;
  } 
    
  
}