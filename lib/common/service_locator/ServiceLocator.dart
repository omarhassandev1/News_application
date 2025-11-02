import 'package:news_app/features/articles/model/api_data_source.dart';
import 'package:news_app/features/articles/model/articles_data_source.dart';
import 'package:news_app/features/articles/repository/articles_repository.dart';
import 'package:news_app/features/articles/view_model/articles_provider.dart';

class ServiceLocator{
  static ArticlesDataSource articlesDataSource = ApiDataSource();
  static ArticlesRepository articlesRepository = ArticlesRepository(articlesDataSource: articlesDataSource);
  static ArticlesProvider articlesProvider = ArticlesProvider(articlesRepository: articlesRepository);
}