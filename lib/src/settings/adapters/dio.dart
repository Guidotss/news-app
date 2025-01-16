import 'package:dio/dio.dart';
import 'package:news_app/src/settings/adapters/dotenv.dart';
import 'package:news_app/src/infraestructure/models/articles_model.dart';

abstract class HttpClient {
  Future<Response<T>> get<T>(String url);
}

class DioHttpClient implements HttpClient {
  final Dio _dio;
  String baseUrl = '';
  DioHttpClient(this._dio) { 
    _dio.options.headers["Authorization"] = Env.newsApiKey;
  }

  final _transformers = <Type, dynamic Function(Map<String, dynamic>)>{
    ArticlesModelResponse: ArticlesModelResponse.fromJson,
  };

  @override
  Future<Response<T>> get<T>(String url) async {
    final response = await _dio.get<Map<String, dynamic>>(baseUrl + url);
    
    final transformer = _transformers[T];
    if (transformer != null) {
      return Response(
        requestOptions: response.requestOptions,
        data: transformer(response.data!) as T,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    }
    
    return response as Response<T>;
  }
}
