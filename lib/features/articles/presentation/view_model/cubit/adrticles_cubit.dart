import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/common/error/response_model.dart';
import 'package:news_app/features/articles/domain/entities/articles_entity.dart';
import 'package:news_app/features/articles/domain/entities/source_entity.dart';
import 'package:news_app/features/articles/domain/use_case/get_articles_usecase.dart';
import 'package:news_app/features/articles/domain/use_case/get_sources_usecase.dart';

import 'articles_state.dart';

@injectable
class ArticlesCubit extends Cubit<ArticlesState> {
  final GetSourcesUseCase _getSourcesUseCase;
  final GetArticlesUsecase _getArticlesUsecase;

  ArticlesCubit({
    required GetSourcesUseCase getSourcesUseCase,
    required GetArticlesUsecase getArticlesUsecase,
  }) : _getSourcesUseCase = getSourcesUseCase,
       _getArticlesUsecase = getArticlesUsecase,
       super(ArticlesInitialState());

  Future<void> getSources(String catId) async {
    emit(GetSourcesLoading());
    Response<List<SourceEntity>> response = await _getSourcesUseCase.call(
      catId,
    );

    switch (response) {
      case Success<List<SourceEntity>>():
        emit(GetSourcesSuccess(sources: response.data));
      case Failure():
        emit(GetSourcesError(error: response.error.toString()));
    }
  }

  Future<void> getArticles(String sourceId, List<SourceEntity> sources) async {
    emit(GetArticlesLoading(sources: sources));
    Response<List<ArticleEntity>> response = await _getArticlesUsecase.call(
      sourceId,
    );

    switch (response) {
      case Success<List<ArticleEntity>>():
        emit(GetArticlesSuccess(articles: response.data, sources));
      case Failure():
        emit(GetArticlesError(sources: sources, error: response.error.toString()));
    }
  }
}
