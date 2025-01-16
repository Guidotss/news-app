import 'package:go_router/go_router.dart';
import 'package:news_app/src/presentation/presentation.dart';
import 'package:flutter/material.dart';

final appRouter = GoRouter(
  routes: <RouteBase>[
    ShellRoute(
      builder: (context, state, child) { 
        return Scaffold(
          body: Stack(
            children: [
              child,
              const Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: CustomBottomNav(
                  title: 'Home',
                ),
              ),
            ],
          ),
        );
      },
      routes: <RouteBase>[
        GoRoute(path: '/', builder: (context, state) => const HomeScreen(), name: 'home'),
      ],
    ),
  ],
);
