import 'package:news_app/src/domain/domain.dart';

abstract class NewsApiDatasource {
  Future<List<Article>> getTopHeadlines();
}
