import 'package:flutter/cupertino.dart';
import 'package:news_app/common/error/failure_model.dart';
import 'package:news_app/features/articles/model/api_service.dart';
import 'package:news_app/features/articles/model/news_response.dart';
import 'package:news_app/features/articles/model/source_response.dart';

class ArticlesProvider extends ChangeNotifier {
  SourceResponse? sources;
  NewsResponse? articles;
  String? sourcesError, articleError;
  bool sourcesLoading = false;
  bool articlesLoading = false;

  getSources(String catName) async {
    sourcesLoading = true;
    sourcesError = null;
    notifyListeners();
    try {
      sources = await ApiService.getSources(catName);
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
      articles = await ApiService.getArticles(sourceId);
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
