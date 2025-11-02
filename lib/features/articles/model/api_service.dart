import 'package:dio/dio.dart';
import 'package:news_app/common/error/failure_model.dart';
import 'package:news_app/features/articles/model/news_response.dart';
import 'package:news_app/features/articles/model/source_response.dart';

import '../../../common/network/network_consts.dart';

class ApiService {
  static Dio dio = Dio(BaseOptions(baseUrl: NetworkConsts.baseUrl));

  static Future<SourceResponse?> getSources(String category) async {
    try {
      Response response = await dio.get(
        NetworkConsts.sourcesEndPoint,
        queryParameters: {'apiKey': NetworkConsts.apiKey, 'category': category},
      );
      SourceResponse sourceResponse = SourceResponse.fromJson(response.data);
      if (sourceResponse.status == 'ok' && response.statusCode==200) {
        return sourceResponse;
      } else {
        throw sourceResponse.message ?? 'something went wrong';
      }
    } on DioException catch (e) {
      throw FailureModel.getNetworkFailure(e);
    } catch (e) {
      throw BaseFailure(errorMessage: e.toString());
    }
  }

  static Future<NewsResponse> getArticles(String sourceID) async {
    try {
      Response response = await dio.get(
        NetworkConsts.newsEndPoints,
        queryParameters: {'apiKey': NetworkConsts.apiKey, 'sources': sourceID},
      );
      NewsResponse news = NewsResponse.fromJson(response.data);
      if(news.status=='ok' && response.statusCode==200) {
        print(news);
        return news;
      }else{
        throw 'something went wrong';
      }
    } on DioException catch (e) {
      throw FailureModel.getNetworkFailure(e);
    } catch (e){
      throw BaseFailure(errorMessage: e.toString());
    }
  }
}
