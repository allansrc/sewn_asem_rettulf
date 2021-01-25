import 'package:dio/dio.dart';

import 'package:mesa_news_app/app/data/models/news_high_light_model.dart';
import 'package:mesa_news_app/app/data/models/news_model.dart';
import 'package:mesa_news_app/app/services/providers/auth_provider.dart';

class NewsRepository {
  final HttpProvider apiProvider;

  NewsRepository(this.apiProvider);

  Future<NewsHighLightModel> getNewsHighlights({String token}) async {
    try {
      final response = await apiProvider.httpProvider.get('/v1/client/news/highlights');
      if (response.statusCode == 200) print('ok');
      return NewsHighLightModel.fromJson(response.data);
    } on DioError catch (err) {
      print(err.response.data["message"]);
      rethrow;
    }
  }

  Future<NewsModel> getNews({int page = 1}) async {
    try {
      final response = await apiProvider.httpProvider.get('/v1/client/news?current_page=$page&per_page=&published_at=');
      if (response.statusCode == 200) print('ok');
      return NewsModel.fromJson(response.data);
    } on DioError catch (err) {
      print(err.response.data["message"]);
      rethrow;
    }
  }
}
