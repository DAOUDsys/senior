part of '../../utils/imports/app_imports.dart';

class ModelNotification {
  String? content;
  bool? isInteractive;
  String? timeStamp;


  ModelNotification({
    this.content,
    this.isInteractive,
    this.timeStamp
  });

  ModelNotification.fromJson(Map<String,dynamic> json) : assert(json.isNotEmpty),
    content = json['content'],
    timeStamp = json['timeStamp'],
    isInteractive = json['isInteractive'];
  
  Map<String,dynamic> toJson() {
    final Map<String,dynamic> data = <String,dynamic>{} ;
    data['content'] =content;
    data['timeStamp'] =timeStamp;
    data['isInteractive'] =isInteractive;

    return data;
  }

}