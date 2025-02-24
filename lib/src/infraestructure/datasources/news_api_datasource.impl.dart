import 'package:news_app/src/domain/domain.dart';
import 'package:news_app/src/infraestructure/mappers/get_articles_mapper.dart';
import 'package:news_app/src/infraestructure/models/articles_model.dart';
import 'package:news_app/src/settings/settings.dart';

class NewsApiDatasourceImpl implements NewsApiDatasource {
  final DioHttpClient _client;

  NewsApiDatasourceImpl(this._client) {
    _client.baseUrl = 'https://newsapi.org/v2';
  }
  
  @override
  Future<List<Article>> getTopHeadlines() async {
    final response = await _client.get<ArticlesModelResponse>(
      '/top-headlines?country=us&category=general',
    ); 
    return response.data?.articles.map((article) => GetArticlesMapper.mapArticleFromModel(article)).toList() ?? [];
  }
}
