part of '../../utils/imports/app_imports.dart';

class ModelNotificationList {

  List<ModelNotification>? notification;

  ModelNotificationList({this.notification});

  ModelNotificationList.fromJson(Map<String,dynamic> json) 
   { if(json['Notification'] != null) {
      // initialize the list
      notification = <ModelNotification> [];
      // get the data from json to our model
      json['Notification'].forEach((x) {
        notification!.add(ModelNotification.fromJson(x));
      });
    }}
    
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic> {};
    if(notification != null) {
      data['Notification'] = notification!.map((x) => x.toJson()).toList(); 
    }
    return data;
  } 
    
  
}