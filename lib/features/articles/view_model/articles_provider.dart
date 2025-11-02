import 'package:flutter/cupertino.dart';
import 'package:news_app/common/error/failure_model.dart';
import 'package:news_app/features/articles/model/news_response.dart';
import 'package:news_app/features/articles/model/source_response.dart';
import 'package:news_app/features/articles/repository/articles_repository.dart';

class ArticlesProvider extends ChangeNotifier {
  SourceResponse? sources;
  ArticlesResponse? articles;
  String? sourcesError, articleError;
  bool sourcesLoading = false;
  bool articlesLoading = false;

  final ArticlesRepository articlesRepository;

  ArticlesProvider({required this.articlesRepository});

  getSources(String catName) async {
    sourcesLoading = true;
    sourcesError = null;
    notifyListeners();
    try {
      sources = await articlesRepository.getSources(catName);
    }
    on FailureModel catch(e){
      sourcesError = e.errorMessage;
    }
    catch (e) {
      sourcesError = e.toString();
    }
    sourcesLoading = false;
    notifyListeners();
  }

  getArticles(String sourceId) async {
    articlesLoading = true;
    articleError = null;
    notifyListeners();
    try {
      articles = await articlesRepository.getArticles(sourceId);
    }
    on FailureModel catch(e){
      articleError = e.errorMessage;
    }
    catch (e) {
      articleError = e.toString();
    }
    articlesLoading = false;
    notifyListeners();
  }
}
