import 'package:news_app/features/articles/domain/entities/articles_entity.dart';
import 'package:news_app/features/articles/domain/entities/source_entity.dart';

abstract class ArticlesState {}

class SourcesInitialState extends ArticlesState {}

class GetSourcesLoading extends ArticlesState {}

class GetSourcesSuccess extends ArticlesState {
  final List<SourceEntity> sources;
  GetSourcesSuccess({required this.sources});
}

class GetSourcesError extends ArticlesState {
  final String error;
  GetSourcesError({required this.error});
}

class ArticlesInitialState extends ArticlesState {}

class GetArticlesLoading extends ArticlesState {
  final List<SourceEntity> sources;

  GetArticlesLoading({required this.sources});
}

class GetArticlesSuccess extends ArticlesState {
  final List<SourceEntity> sources;
  final List<ArticleEntity> articles;
  GetArticlesSuccess(this.sources, {required this.articles});
}

class GetArticlesError extends ArticlesState {
  final List<SourceEntity> sources;
  final String error;
  GetArticlesError({required this.sources, required this.error});
}
