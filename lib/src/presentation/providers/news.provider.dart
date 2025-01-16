import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/domain/domain.dart';
import 'package:news_app/src/presentation/providers/providers.dart';

final newsTopHeadlinesProvider = FutureProvider<List<Article>>((ref) async {
  final repository = ref.watch(newsRepositoryProvider);
  return repository.getTopHeadlines();
});

typedef GetNewsCallBack = Future<List<Article>> Function();

class NewsController extends StateNotifier<List<Article>> {
  final GetNewsCallBack _getNews;
  bool isLoading = false; 

  NewsController(this._getNews) : super([]);

  Future<void> getNews() async {
    if (isLoading) return;
    isLoading = true;
    final news = await _getNews();
    state = [...state, ...news];
    isLoading = false;
  }
}