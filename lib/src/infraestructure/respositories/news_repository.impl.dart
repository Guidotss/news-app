import 'package:news_app/src/domain/domain.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsApiDatasource datasource;

  NewsRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<List<Article>> getTopHeadlines() async {
    return datasource.getTopHeadlines();
  }
}
