import 'package:flutter/material.dart';



class AuthUIProvider extends ChangeNotifier{


  String? _authHeader = 'login' ;


  String get authHeader {
    return _authHeader! ;
  }

  set setAuthHeader (String value){
    _authHeader = value ;
     notifyListeners();
  }

}