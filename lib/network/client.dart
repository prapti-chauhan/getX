import 'package:dio/dio.dart';
import 'package:getx_demo/network/api_client.dart';

class Client {
  final client = ApiClient(Dio(BaseOptions(contentType: 'application/json')));
}
