import 'package:injectable/injectable.dart';
import 'package:news_app/common/error/failure_model.dart';
import 'package:news_app/common/error/response_model.dart';
import 'package:news_app/features/articles/data/data_source/articles_data_source.dart';
import 'package:news_app/features/articles/data/mapper/articles_mapper.dart';
import 'package:news_app/features/articles/data/models/news_response.dart';
import 'package:news_app/features/articles/data/models/source_response.dart';
import 'package:news_app/features/articles/domain/entities/articles_entity.dart';
import 'package:news_app/features/articles/domain/entities/source_entity.dart';
import 'package:news_app/features/articles/domain/repository/articles_repository.dart';

@Injectable(as: ArticlesRepository)
class ArticlesRepositoryImpl implements ArticlesRepository {
  final ArticlesDataSource _articlesDataSource;

  ArticlesRepositoryImpl({required ArticlesDataSource articlesDataSource})
    : _articlesDataSource = articlesDataSource;
  @override
  Future<Response<List<ArticleEntity>>> getArticles(String sourceId) async {
    try {
      ArticlesResponse articlesResponse = await _articlesDataSource.getArticles(
        sourceId,
      );
      Response<List<ArticleEntity>> response = Success<List<ArticleEntity>>(
        data:
            (articlesResponse.articles ?? [])
                .map((e) => e.getEntity())
                .toList(),
      );
      return response;
    } on FailureModel catch (e) {
      return Failure(error: e);
    } catch (e) {
      return Failure(error: BaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Response<List<SourceEntity>>> getSources(String categoryId) async {
    try {
      SourceResponse sourceResponse = await _articlesDataSource.getSources(
        categoryId,
      );
      return Success(data: sourceResponse.sources ?? []);
    } on FailureModel catch (e) {
      return Failure(error: e);
    }
  }

  @override
  Future<Response<List<ArticleEntity>>> searchArticles(String query) async {
    try {
      final ArticlesResponse response =
      await _articlesDataSource.searchArticles(query);
      final List<Articles> results = response.articles??[];
      final List<ArticleEntity> entities =
      results.map((e) => e.getEntity()).toList();
      return Success(data: entities);
    } on FailureModel catch (e) {
      return Failure(error: e);
    } catch (e) {
      return Failure(error: BaseFailure(errorMessage: e.toString()));
    }
  }



}
