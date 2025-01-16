import 'package:news_app/src/domain/domain.dart';

abstract class NewsRepository {
  Future<List<Article>> getArticles();
}
