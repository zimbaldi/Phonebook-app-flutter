import 'package:dio/dio.dart';

class JsonplaceholderDio {
  final _dio = Dio();

  Dio get dio => _dio;

  JsonplaceholderDio() {
    //_dio.options.baseUrl = 'http://10.0.2.2:8080'; // local IP for Android
    _dio.options.baseUrl = 'http://localhost:8080'; // local IP for iOS
  }
}
