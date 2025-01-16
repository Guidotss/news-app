

import 'package:go_router/go_router.dart';
import 'package:news_app/src/presentation/presentation.dart';

final appRouter = GoRouter(
  routes: <GoRoute>[
    GoRoute(path: '/', builder: (context, state) => const HomeView()),
  ],
);