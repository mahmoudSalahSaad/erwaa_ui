import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:erwaa/Models/user_model.dart';
import 'package:erwaa/services/http_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';





class UserProvider extends ChangeNotifier {
  late SharedPreferences _preferences;
  bool _isLoading  = false ;
  final HttpServiceImpl httpService = HttpServiceImpl();
  bool _unauth = true;

  bool _isAuthenticated = false;

  bool? _visitFirstTime = true;

  UserModel? _user ;








  UserModel? get user {
    return _user ;
  }



  bool get visitFirstTime {
    return _visitFirstTime!;
  }


  bool get isLoading{
    return _isLoading ;
  }
  bool get unauth {
    return _unauth;
  }
  bool get isAuthenticated {
    return _isAuthenticated;
  }



  Future<void> getVisitFirstTime() async {
    _preferences = await SharedPreferences.getInstance();
    _visitFirstTime =
        _preferences.getBool('firstTime') ;

    // ignore: unnecessary_null_comparison
    if (_visitFirstTime == null) {
      storeVisitFirstTime();
      _visitFirstTime = true;
    }
  }
  Future<void> storeVisitFirstTime() async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.setBool('firstTime', false);
  }
  Future<void> autoAuthenticated() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    bool isAuthenticated;
    preferences.getBool('userExistence') != null
        ? isAuthenticated = preferences.getBool('userExistence')!
        : isAuthenticated = false;
    if (isAuthenticated) {
      var user = preferences.getString('user');
      if (user != null) {

        _isAuthenticated = true;
      } else {
        _isAuthenticated = false;
      }
    } else {// _user = UserModel.fromJson(json.decode(user));
      return;
    }
  }

  Future<void> storeAuthUser(UserModel? user, String token,
      [isAuth = false]) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    if (isAuth) {
      preferences.setBool('userExistence', true);
      Map<String, dynamic> userMap = user!.toJson();
      if (token != '') {
        preferences.setString('authToken', token);
      }
      preferences.setString('user', jsonEncode(userMap));
    } else {
      preferences.remove('user');
      preferences.remove('userExistence');
      preferences.remove('authToken');
      preferences.remove('checkUserSubscription');
    }
  }




  Future<Map<String, dynamic>> register(formData) async {
    Map<String, dynamic> result = {
      'success': false,
      'error': null,
      'message': null
    };
    final Map<String, dynamic> userData = {
      'first_name' : formData['first_name'] ,
      'last_name' : formData['last_name'] ,
      'mobile' : formData['mobile'],
      'code'  : formData['code'] ,
      'password' : formData['password'],
      "password_confirmation" : formData['password_confirmation'] ,
      "fcm_token" : "dummyfcm" ,
      "mobile_type" : Platform.isAndroid ? "Android" : "IOS",
      "login_type" : Platform.isAndroid ? "Android" : "IOS"
    };
    _isLoading = true;
    notifyListeners();
    String url = '/register';
    httpService.init();
    try {
      Response response = await httpService.postRequest(url, userData, '');
      if (response.statusCode == 200 && response.data['status'] == true) {
        var parsedData  = response.data['user'] ;
        _user = UserModel(
          id: parsedData['id'] ,
          apiToken: parsedData['api_token'] ,
          code: parsedData['code'] ,
          fcmToken: 'dummydata' ,
          firstName: parsedData['first_name'] ,
          lastName: parsedData['last_name'] ,
          loginType: parsedData['login_type'] ,
          mobile: parsedData['mobile'] ,
          verified: parsedData['verified'] ,
        ) ;
        storeAuthUser(_user, _user!.apiToken! , true) ;
        _unauth = false ;
        result['message'] = response.data['message'] ;
        result['success'] = true;
      } else {
        _unauth = true ;
        result['success'] = false ;
        result['message'] = response.data['message'] ;
      }
    } catch (error) {
      result['message'] = error;
    }
    _isLoading = false;
    notifyListeners();
    return result;
  }
  Future<Map<String, dynamic>> login(formData) async {
    Map<String, dynamic> result = {
      'success': false,
      'error': null,
      'message': null
    };
    final Map<String, dynamic> userData = {

      'mobile' : formData['mobile'],
      'password' : formData['password'] ,
      'code'  : formData['code'] ,
      "mobile_type" : Platform.isAndroid ? "Android" : "IOS",
      "login_type" : Platform.isAndroid ? "Android" : "IOS"

    };
    _isLoading = true;
    notifyListeners();
    String url = '/login';
    httpService.init();
    try {
      Response response = await httpService.postRequest(url, userData, '');
      if (response.statusCode == 200 && response.data['status'] == true) {
        var parsedData  = response.data['user'] ;
        _user = UserModel(
          id: parsedData['id'] ,
          apiToken: parsedData['api_token'] ,
          code: parsedData['code'] ,
          fcmToken: 'dummydata' ,
          firstName: parsedData['first_name'] ,
          lastName: parsedData['last_name'] ,
          loginType: parsedData['login_type'] ,
          mobile: parsedData['mobile'] ,
          verified: parsedData['verified'] ,
        ) ;
        storeAuthUser(_user, _user!.apiToken! , true) ;
        _unauth = false ;
        result['message'] = response.data['message'] ;
        result['success'] = true;
      } else {
        _unauth = true ;
        result['success'] = false ;
        result['message'] = response.data['message'] ;
      }
    } catch (error) {
      result['message'] = error;
    }
    _isLoading = false;
    notifyListeners();
    return result;
  }
  Future<Map<String, dynamic>> verify(formData) async {
    Map<String, dynamic> result = {
      'success': false,
      'error': null,
      'message': null
    };
    final Map<String, dynamic> userData = {

      'verification_code' : formData['verification_code']

    };
    _isLoading = true;
    notifyListeners();
    String url = '/user/verify';
    httpService.init();
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final token = sharedPreferences.getString('authToken');
      Response response = await httpService.postRequest(url, userData,token ?? '');

      if (response.statusCode == 200 && response.data['status'] == true) {

        result['message'] = response.data['message'] ;
        result['success'] = true;
      } else {
        result['success'] = false ;
        result['message'] = response.data['message'] ;
      }
    } catch (error) {
      result['message'] = error;
    }
    _isLoading = false;
    notifyListeners();
    return result;
  }
  Future<Map<String, dynamic>> verifyForgetPassword(formData) async {
    Map<String, dynamic> result = {
      'success': false,
      'error': null,
      'message': null ,
      'token' : null ,
    };
    final Map<String, dynamic> userData = {

      'mobile_code' : formData['mobile_code'] ,
      'mobile' : formData['mobile'] ,
      'code' : formData['code'] ,


    };
    _isLoading = true;
    notifyListeners();
    String url = '/verify-forget-password-code';
    httpService.init();
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final token = sharedPreferences.getString('authToken');
      Response response = await httpService.postRequest(url, userData,token ?? '');

      if (response.statusCode == 200 && response.data['status'] == true) {

        result['token'] = response.data['token'] ;

        result['message'] = response.data['message'] ;
        result['success'] = true;
      } else {
        result['success'] = false ;
        result['message'] = response.data['message'] ;
      }
    } catch (error) {
      result['message'] = error;
    }
    _isLoading = false;
    notifyListeners();
    return result;
  }
  Future<Map<String, dynamic>> resetPassword(formData) async {
    Map<String, dynamic> result = {
      'success': false,
      'error': null,
      'message': null
    };
    final Map<String, dynamic> userData = {

      'token' : formData['token'] ,
      'password' : formData['password'] ,
      'password_confirmation' : formData['password_confirmation'] ,


    };
    _isLoading = true;
    notifyListeners();
    String url = '/reset-password';
    httpService.init();
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final token = sharedPreferences.getString('authToken');
      Response response = await httpService.postRequest(url, userData,token ?? '');

      if (response.statusCode == 200 && response.data['status'] == true) {


        var parsedData  = response.data['user'] ;
        _user = UserModel(
          id: parsedData['id'] ,
          apiToken: parsedData['api_token'] ,
          code: parsedData['code'] ,
          fcmToken: 'dummydata' ,
          firstName: parsedData['first_name'] ,
          lastName: parsedData['last_name'] ,
          loginType: parsedData['login_type'] ,
          mobile: parsedData['mobile'] ,
          verified: parsedData['verified'] ,
        ) ;
        storeAuthUser(_user, _user!.apiToken! , true) ;
        _unauth = false ;
        result['message'] = response.data['message'] ;
        result['success'] = true;
      } else {
        result['success'] = false ;
        result['message'] = response.data['message'] ;
      }
    } catch (error) {
      result['message'] = error;
    }
    _isLoading = false;
    notifyListeners();
    return result;
  }
  Future<Map<String, dynamic>> forgetPassword(formData) async {
    Map<String, dynamic> result = {
      'success': false,
      'error': null,
      'message': null
    };
    final Map<String, dynamic> userData = {

      'mobile_code' : formData['mobile_code'],
      'mobile' : formData['mobile'],

    };
    _isLoading = true;
    notifyListeners();
    String url = '/forget-password';
    httpService.init();
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final token = sharedPreferences.getString('authToken');
      Response response = await httpService.postRequest(url, userData,token ?? '');
      print(response.data);

      if (response.statusCode == 200 && response.data['status'] == true) {

        result['message'] = response.data['message'] ;
        result['success'] = true;
      } else {
        result['success'] = false ;
        result['message'] = response.data['message'] ;
      }
    } catch (error) {
      result['message'] = error;
    }
    _isLoading = false;
    notifyListeners();
    return result;
  }
  Future<Map<String, dynamic>> resend(formData) async {
    Map<String, dynamic> result = {
      'success': false,
      'error': null,
      'message': null
    };
    final Map<String, dynamic> userData = {

      'code' : formData['code'],
      'mobile' : formData['mobile'],
      'type' : formData['type'],

    };
    _isLoading = true;
    notifyListeners();
    String url = '/resend-code';
    httpService.init();
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final token = sharedPreferences.getString('authToken');
      Response response = await httpService.postRequest(url, userData,token ?? '');

      if (response.statusCode == 200 && response.data['status'] == true) {

        result['message'] = response.data['message'] ;
        result['success'] = true;
      } else {
        result['success'] = false ;
        result['message'] = response.data['message'] ;
      }
    } catch (error) {
      result['message'] = error;
    }
    _isLoading = false;
    notifyListeners();
    return result;
  }
}