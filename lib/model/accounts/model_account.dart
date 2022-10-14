part of '../../utils/imports/app_imports.dart';

class ModelAccount {
  String? name;
  String? password;
  String? email;
  String? useType;
  bool? connectToSys;


  ModelAccount({
    this.name,
    this.password,
    this.email,
    this.useType,
    this.connectToSys=false,
  });

  setEmail(String? email) => this.email = email;
  setPass(String? password)=> this.password = password;
  setName(String? name)=> this.name = name;
  setType(String? useType)=> this.useType = useType;
  setConnectionState(bool connectToSys) => this.connectToSys = connectToSys;
  
  @override 
  String toString() => 'ModelUser (email: $email , password: $password , name: $name , user type: $useType, connectToSys: $connectToSys)';
}