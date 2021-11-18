import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserProvider  with ChangeNotifier {
  String _firstName = "";
  String _lastName = "";
  String _email = "";
  String _password = "";
  String _mobileNumber = "";
  String _address = "";

  String getEmail() => _email;
  String getPassword() => _password;
  void setUser(String firstName,String lastName, String mobileNum, String addr ){
    _firstName = firstName;
    _lastName = lastName;
    _mobileNumber = mobileNum;
    _address = addr;
  }

  void setUserEmailPassword(String email, String password){
    _email = email;
    _password = password;
  }


}