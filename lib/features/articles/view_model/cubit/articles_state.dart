import 'package:news_app/features/articles/model/news_response.dart';
import 'package:news_app/features/articles/model/source_response.dart';

abstract class ArticlesState{}

class SourcesInitialState extends ArticlesState{}

class GetSourcesLoading extends ArticlesState{
}
class GetSourcesSuccess extends ArticlesState{
  final SourceResponse sourceResponse;
  GetSourcesSuccess({required this.sourceResponse});
}
class GetSourcesError extends ArticlesState{
  final String error;
  GetSourcesError({required this.error});
}



class ArticlesInitialState extends ArticlesState{}

class GetArticlesLoading extends ArticlesState{
  final SourceResponse sourceResponse;

  GetArticlesLoading({required this.sourceResponse});
}
class GetArticlesSuccess extends ArticlesState{
  final SourceResponse sourceResponse;
  final ArticlesResponse articlesResponse;
  GetArticlesSuccess(this.sourceResponse, {required this.articlesResponse});
}
class GetArticlesError extends ArticlesState{
  final SourceResponse sourceResponse;
  final String error;
  GetArticlesError({required this.sourceResponse, required this.error});
}

