import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/presentation/presentation.dart';
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
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Noticias'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: news.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemCount: news.length,
            separatorBuilder: (context, index) => const Divider(height: 32),
            itemBuilder: (context, index) {
              return NewsCard(article: news[index]);
            },
          ),
    );
  }
}

