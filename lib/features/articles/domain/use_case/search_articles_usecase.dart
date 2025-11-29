import 'package:injectable/injectable.dart';
import 'package:news_app/common/error/response_model.dart';
import 'package:news_app/features/articles/domain/repository/articles_repository.dart';

import '../entities/articles_entity.dart';

@injectable
class SearchArticlesUseCase {
  final ArticlesRepository repository;

  SearchArticlesUseCase(this.repository);

  Future<Response<List<ArticleEntity>>> call(String query) {
    return repository.searchArticles(query);
  }
}
