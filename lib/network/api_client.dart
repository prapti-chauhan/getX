import 'package:dio/dio.dart';
import 'package:getx_demo/models/compact_api.dart';
import 'package:getx_demo/models/todo.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // var options = BaseOptions(headers: {'contentType ':' application/json'});
  // Dio dio = Dio(options);
  //
  // final ApiClient _instance = ApiClient._privateConstructor(dio, baseUrl: baseUrl);

  @GET('todos/')
  Future<List<Home>> getList();

  @GET('comments?postId={id}')
  Future<List<DetailPage>> getDetailList(@Path("id") int i);
}
