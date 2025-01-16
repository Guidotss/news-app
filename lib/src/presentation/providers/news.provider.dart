import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/domain/domain.dart';
import 'package:news_app/src/presentation/providers/providers.dart';

final newsTopHeadlinesProvider = StateNotifierProvider<NewsController, List<Article>>((ref) {
  final repository = ref.watch(newsRepositoryProvider);
  return NewsController(
    getNews: repository.getTopHeadlines,
  );
});

typedef GetNewsCallBack = Future<List<Article>> Function();

class NewsController extends StateNotifier<List<Article>> {
  final GetNewsCallBack getNews;
  bool isLoading = false; 

  NewsController({required this.getNews}) : super([]);
  

  Future<void> fetchNews() async {
    
    if (isLoading) return;
    isLoading = true;
    final news = await getNews();
    state = [...state, ...news];
    isLoading = false;
  }
}