part of '../imports/app_imports.dart';

class AppValidators {

  /// [isEmail] check email pattern
  static String? isEmail(String? value) {
    // trim => remove space from first and last indexes in string
    if(value?.isEmpty ?? true) {
      return "Please enter email address";
    }
    else if(!valid.isEmail(value!.trim())){
      return 'Please enter a valid email address';
    }
    return null;
  }
  static String? isPass(String? value) {
    // trim => remove space from first and last indexes in string
    if(value?.isEmpty ?? true) {
      return "Please enter password";
    }
    else if(!valid.isLength(value!.trim(),8,20)){
      return 'least 8 characters for password';
    }
    return null;
  }

  static String? isEqualPass(String? value, String? pass) {
    // trim => remove space from first and last indexes in string
    if(value?.isEmpty ?? true) {
      return "Please enter password";
    }
    else if(!valid.equals(value!.trim(), pass!.trim())){
      return 'passwords must match';
    }
    return null;
  }

  static String? isDate(String? value) {
    // trim => remove space from first and last indexes in string
    if(value?.isEmpty ?? true) {
      return "Please enter expire date";
    }
    else if(!valid.isDate(value!.trim())){
      return 'Please enter a valid date format';
    }
    return null;
  }
  
}