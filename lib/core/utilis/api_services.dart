import 'package:dio/dio.dart';
class ApiServices {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: "https://fakestoreapi.com/")
  );
  Future<dynamic> get({required String endPoint}) async {
    Response response = await _dio.get(endPoint,options: Options(
      headers: {'Content-Type' : 'application/x-www-form-urlencoded'}
    ));
    return response.data;
  }
  //............................................................................
  Future<dynamic> post({required String endPoint, required dynamic data,}) async {
    Response response = await _dio.post(
      endPoint,
      data: data,
    );
    return response.data;
  }
}