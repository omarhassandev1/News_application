import 'package:news_app/features/articles/data/data_source/articles_data_source.dart';

class FirebaseDataSource extends ArticlesDataSource{
  @override
  getArticles(String sourceId) {
    throw UnimplementedError();
  }

  @override
  getSources(String sourceId) {
    throw UnimplementedError();
  }

  @override
  searchArticles(String query) {
    throw UnimplementedError();
  }
  
}