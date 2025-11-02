import 'package:news_app/features/articles/model/articles_data_source.dart';

class FirebaseDataSource extends ArticlesDataSource{
  @override
  getArticles(String sourceId) {
    throw UnimplementedError();
  }

  @override
  getSources(String sourceId) {
    throw UnimplementedError();
  }
  
}