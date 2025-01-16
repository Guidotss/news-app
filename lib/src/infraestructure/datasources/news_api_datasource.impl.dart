import 'package:flutter/foundation.dart';
import 'package:news_app/src/domain/domain.dart';
import 'package:news_app/src/settings/settings.dart';

class NewsApiDatasourceImpl implements NewsApiDatasource {
  final DioHttpClient _client;

  NewsApiDatasourceImpl(this._client) {
    _client.baseUrl = 'https://newsapi.org/v2';
  }
  
  @override
  Future<List<Article>> getTopHeadlines() async {
    
    final response = await _client.get(
      '/top-headlines?country=us&category=general',
    );
    debugPrint('Response: $response');
    final List<Article> articles = [];
    return articles;
  }
}