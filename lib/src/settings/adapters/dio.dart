import 'package:dio/dio.dart';
import 'package:news_app/src/settings/adapters/dotenv.dart';

abstract class HttpClient {
  Future<Response<T>> get<T>(String url);
}

class DioHttpClient implements HttpClient {
  final Dio _dio;
  DioHttpClient(this._dio) { 
    _dio.options.headers["Authorization"] = Env.newsApiKey;
  }

  @override
  Future<Response<T>> get<T>(String url) async {
    return await _dio.get(url);
  }
}
