part of '../../utils/imports/app_imports.dart';

class ModelNotification {
  String? content;
  String? timeStamp;

  ModelNotification({this.content, this.timeStamp});

  ModelNotification.fromJson(Map<String, dynamic> json)
      : assert(json.isNotEmpty),
        content = json['content'],
        timeStamp = json['timeStamp'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    data['timeStamp'] = timeStamp;

    return data;
  }
}
