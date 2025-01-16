import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/presentation/providers/providers.dart';


class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  _HomeView(),
    ); 
  }
}
class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  ConsumerState<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(newsTopHeadlinesProvider.notifier).fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    final news = ref.watch(newsTopHeadlinesProvider);
    if(news.isEmpty) {
      return const Center(child: Text('No news found'));
    }
    return SafeArea(
      child: ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
        final article = news[index];
        return ListTile(
          title: Text(article.title),
          subtitle: Text(article.description),
          leading: Image.network(article.urlToImage),
        );
      },
    ));
  }
}