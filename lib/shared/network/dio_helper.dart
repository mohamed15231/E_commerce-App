import 'package:dio/dio.dart';

import '../component/constant.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(baseUrl: "https://student.valuxapps.com/api/",
    receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> postData({
    required Object data,
    required String url,
     String? lang="en",
     // String? token,
}){
    dio!.options.headers={
      'lang':lang,
      'Authorization': token,
      'Content-Type':'application/json'
    };
   return dio!.post(
     url,
     data: data,

   );
  }


  static Future<Response> getData({
    Map<String,dynamic>? query,
    required String url,
     String? lang="en",
}){
    dio!.options.headers={
      'lang':lang,
      'Authorization': token,
      'Content-Type':'application/json'
    };
   return dio!.get(
     url,
     queryParameters: query,

   );
  }

  static Future<Response> putData({
    Map<String,dynamic>? query,
    required String url,
     String? lang="en",
}){
    dio!.options.headers={
      'lang':lang,
      'Authorization': token,
      'Content-Type':'application/json'
    };
   return dio!.put(
     url,
     data: query,

   );
  }
}
