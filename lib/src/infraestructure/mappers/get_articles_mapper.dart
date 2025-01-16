import 'package:news_app/src/domain/domain.dart';
import 'package:news_app/src/infraestructure/models/articles_model.dart';

class GetArticlesMapper {
  static Article mapArticleFromModel(ArticleModel articleModel) {
    return Article(
      source: Source(
        id: articleModel.source.id ?? "",
        name: articleModel.source.name 
      ),
      author: articleModel.author,
      title: articleModel.title,
      description: articleModel.description,
      url: articleModel.url,
      urlToImage: articleModel.urlToImage,
      publishedAt: articleModel.publishedAt,
      content: articleModel.content,
    );
  }
}