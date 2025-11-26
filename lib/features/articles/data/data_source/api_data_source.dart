import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/common/error/failure_model.dart';
import 'package:news_app/features/articles/data/data_source/articles_data_source.dart';
import 'package:news_app/features/articles/data/models/news_response.dart';
import 'package:news_app/features/articles/data/models/source_response.dart';

import '../../../../common/network/network_consts.dart';

@LazySingleton(as: ArticlesDataSource)
class ApiDataSource extends ArticlesDataSource{
  // static Dio dio = Dio(BaseOptions(baseUrl: NetworkConsts.baseUrl));
  final Dio dio;

  ApiDataSource({required this.dio});

  @override
  Future<SourceResponse> getSources(String category) async {
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

  @override
  Future<ArticlesResponse> getArticles(String sourceID) async {
    try {
      Response response = await dio.get(
        NetworkConsts.newsEndPoints,
        queryParameters: {'apiKey': NetworkConsts.apiKey, 'sources': sourceID},
      );
      ArticlesResponse news = ArticlesResponse.fromJson(response.data);
      if(news.status=='ok' && response.statusCode==200) {
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
