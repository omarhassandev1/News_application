import 'package:dio/dio.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/models/source_response.dart';
import 'package:news_app/network/network_consts.dart';

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
      throw e.message.toString();
    } catch (e) {}
    return null;
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
      throw e.message??'something went wrong';
    } catch (e){
      throw e.toString();
    }
  }
}
