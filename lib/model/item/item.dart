
part of '../../utils/imports/app_imports.dart';

class ItemModel {
  String? month;
  String? day;
  String? name;
  String? store;
  String? result;



  ItemModel({
    this.month = '',
    this.name = '',
    this.day,
    this.store = '',
    this.result = '',
  });

  setId(String? month) => this.month = month;
  setEmail(String? day) => this.day = day;
  setPass(String? store)=> this.store = store;
  setName(String? name)=> this.name = name;
  setType(String? result)=> this.result = result;


  ItemModel.fromSnapshot(snapshot)
    : name = snapshot.data()['name'],
      day = snapshot.data()['day'],
      store = snapshot.data()['store'],
      month = snapshot.data()['month'],
      result = snapshot.data()['result'];
  
  @override 
  String toString() => 'Item (month: $month , day: $day , store: $store , name: $name , result: $result)';
}