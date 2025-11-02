import 'package:news_app/features/articles/model/articles_data_source.dart';
import 'package:news_app/features/articles/model/news_response.dart';
import 'package:news_app/features/articles/model/source_response.dart';

class ArticlesRepository{

  final ArticlesDataSource articlesDataSource;

  ArticlesRepository({required this.articlesDataSource});

  Future<SourceResponse> getSources(String catId)async{
    return await articlesDataSource.getSources(catId);
  }

  Future<ArticlesResponse> getArticles(String sourceId)async{
    return await articlesDataSource.getArticles(sourceId);
  }



}