part of '../../utils/imports/app_imports.dart';

class ModelAccountList {

  List<ModelAccount>? account;

  ModelAccountList({this.account});

  ModelAccountList.fromJson(Map<String,dynamic> json) 
    :assert(json['account'] != null) {
      // initialize the list
      account = <ModelAccount> [];
      // get the data from json to our model
      json['account'].forEach((person) {
        account!.add(ModelAccount.fromJson(person));
      });
    }
    
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic> {};
    if(account != null) {
      data['account'] = account!.map((person) => person.toJson()).toList(); 
    }
    return data;
  } 
    
  
}