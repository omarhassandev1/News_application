import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/articles/model/news_response.dart';
import 'package:news_app/features/articles/model/source_response.dart';
import 'package:news_app/features/articles/repository/articles_repository.dart';
import 'package:news_app/features/articles/view_model/cubit/articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit(this.articlesRepository) : super(ArticlesInitialState());

  final ArticlesRepository articlesRepository;

  Future<void> getSources(String catId) async {
    try {
      emit(GetSourcesLoading());
      SourceResponse sourceResponse = await articlesRepository.getSources(
        catId,
      );
      emit(GetSourcesSuccess(sourceResponse: sourceResponse));
    } catch (e) {
      emit(GetSourcesError(error: e.toString()));
    }
  }

  Future<void> getArticles(
    String sourceId,
    SourceResponse sourceResponse,
  ) async {
    try {
      emit(GetArticlesLoading(sourceResponse: sourceResponse));
      ArticlesResponse articlesResponse = await articlesRepository.getArticles(
        sourceId,
      );
      emit(GetArticlesSuccess(articlesResponse: articlesResponse,sourceResponse));
    } catch (e) {
      emit(
        GetArticlesError(sourceResponse: sourceResponse, error: e.toString()),
      );
    }
  }
}
