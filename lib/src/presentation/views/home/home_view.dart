import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/presentation/providers/providers.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final news = ref.watch(newsTopHeadlinesProvider);
    print(news);
    return const Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
