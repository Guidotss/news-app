
import 'dart:convert';

ArticlesModelResponse articlesFromJson(String str) => ArticlesModelResponse.fromJson(json.decode(str));

String articlesToJson(ArticlesModelResponse data) => json.encode(data.toJson());

class ArticlesModelResponse {
    String status;
    int totalResults;
    List<ArticleModel> articles;

    ArticlesModelResponse({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

    factory ArticlesModelResponse.fromJson(Map<String, dynamic> json) => ArticlesModelResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<ArticleModel>.from(json["articles"].map((x) => ArticleModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": articles.map((x) => x.toJson()).toList(),
    };
}

class ArticleModel {
    SourceModel source;
    String author;
    String title;
    String description;
    String url;
    String urlToImage;
    String publishedAt;
    String content;

    ArticleModel({
        required this.source,
        required this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
        required this.content,
    });

    factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        source: SourceModel.fromJson(json["source"]),
        author: json["author"] ?? "",
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        url: json["url"] ?? "",
        urlToImage: json["urlToImage"] ?? "",
        publishedAt: json["publishedAt"] ?? "",
        content: json["content"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt,
        "content": content,
    };
}

class SourceModel {
    dynamic id;
    String name;

    SourceModel({
        required this.id,
        required this.name,
    });

    factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
