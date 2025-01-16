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
    
    return const Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
