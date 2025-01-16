import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/domain/repositories/news_repository.dart';
import 'package:news_app/src/infraestructure/infraestructure.dart';
import 'package:news_app/src/settings/adapters/dio.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final newsApiDatasourceProvider = Provider<NewsApiDatasourceImpl>((ref) {
  final dio = ref.watch(dioProvider);
  return NewsApiDatasourceImpl(
    DioHttpClient(dio),
  );
});

final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  final datasource = ref.watch(newsApiDatasourceProvider);
  return NewsRepositoryImpl(
    datasource: datasource,
  );
});
