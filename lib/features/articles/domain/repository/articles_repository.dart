import 'package:news_app/common/error/response_model.dart';
import 'package:news_app/features/articles/domain/entities/articles_entity.dart';
import 'package:news_app/features/articles/domain/entities/source_entity.dart';


abstract class ArticlesRepository{
  Future<Response<List<ArticleEntity>>> getArticles(String sourceId);
  Future<Response<List<SourceEntity>>> getSources(String categoryId);
}