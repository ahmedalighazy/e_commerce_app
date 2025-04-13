import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/resources/constants_manager.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }

  Future<Response> getData(String endPoint,
      {Map<String, dynamic>? queryParameters}) {
    return dio.get(AppConstants.baseUrl + endPoint,
        queryParameters: queryParameters,
        options: Options(validateStatus: ((status) => true)));
  }

  Future<Response> postData(String endPoint,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? body}) {
    return dio.post(AppConstants.baseUrl + endPoint,
        data: body,
        queryParameters: queryParameters,
        options: Options(validateStatus: ((status) => true)));

    ///vip options validateStates because dio not check status code 200:300
  }
}

