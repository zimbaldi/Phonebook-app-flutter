import 'package:dio/dio.dart';
import 'dart:io' show Platform;

class JsonplaceholderDio {
  final _dio = Dio();

  Dio get dio => _dio;

  JsonplaceholderDio() {
    if (Platform.isAndroid) {
      _dio.options.baseUrl = 'http://10.0.2.2:8080'; // local IP for Android
    } else if (Platform.isIOS) {
      _dio.options.baseUrl = 'http://localhost:8080'; // local IP for iOS
    }
  }
}
