part of '../../utils/imports/app_imports.dart';

class ModelNotification {
  String? content;
  bool? isInteractive;


  ModelNotification({
    this.content,
    this.isInteractive
  });

  ModelNotification.fromJson(Map<String,dynamic> json) : assert(json.isNotEmpty),
    content = json['content'],
    isInteractive = json['isInteractive'];
  
  Map<String,dynamic> toJson() {
    final Map<String,dynamic> data = <String,dynamic>{} ;
    data['content'] =content;
    data['isInteractive'] =isInteractive;

    return data;
  }

}