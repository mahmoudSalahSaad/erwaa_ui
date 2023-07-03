import 'package:dio/dio.dart';
import 'package:erwaa/utils/constants.dart';

import 'package:http_certificate_pinning/http_certificate_pinning.dart';


import 'http_service.dart';

String  baseUrl = '${Constants.BASE_URL}/api';
//const baseUrl = 'http://10.0.2.2:8000/api';
const appTOKEN = '';

const List<String> allowedSHAFingerprints = [
];

class HttpServiceImpl implements HttpService {
  Dio _dio = Dio();
  @override
  Future<Response> getRequest(String url, token ) async {
    Response response;
    try {
      response = await _dio.get(url,
          options: Options(headers: {
            "authorization": "Bearer $token",
          } ));
    } on DioError catch (e) {
      response = e.response!;
    }

    return response;
  }

  @override
  Future<Response> postRequest(String url, postData, token) async {
    Response response;
    try {
      response = await _dio.post(url,
          data: postData,
          options: Options(headers: {
            "Authorization": "Bearer $token",
          }));
    } on DioError catch (e) {
      response = e.response!;
    }
    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(CertificatePinningInterceptor(
      allowedSHAFingerprints: allowedSHAFingerprints,
    ));
  }

  @override
  void init() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'appToken': appTOKEN,
        "fcm" :  '',
        'Accept': '*/*',
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'Charset': 'utf-8',
        'Password' : "123456",
        "Language"  : 'ar',

      },
    ));
    //initializeInterceptors();
  }
}
