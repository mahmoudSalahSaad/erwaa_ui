import 'package:dio/dio.dart';

abstract class HttpService {
  void init();

  Future<Response> getRequest(String url, String token);
  Future<Response> postRequest(String url, postData, String token);
}
