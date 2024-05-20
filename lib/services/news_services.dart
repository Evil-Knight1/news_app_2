import 'package:dio/dio.dart';
import 'package:news_app_2/models/news_model.dart';

class NewsServices {
  final Dio dio;
  NewsServices({required this.dio});
  Future<List<NewsModel>> getTopHeadLines({String category = 'general'}) async {
    try {
      final response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=2a56c200c27648649baa915831f9582d');
      final Map<String, dynamic> jsonData = response.data;
      final articles = jsonData['articles'];
      List<NewsModel> news = [];
      for (var article in articles) {
        news.add(NewsModel.fromJson(article));
      }
      return news;
    } catch (e) {
      throw Exception(e);
    }
  }
}
