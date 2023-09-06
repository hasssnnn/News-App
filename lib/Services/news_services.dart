import 'package:dio/dio.dart';
import 'package:news/models/articles_model.dart';

class NewsServices {
  NewsServices(this.dio);
  final Dio dio;

  Future<List<ArticleModel>> getTopHeadLines({required String category}) async {
    try {
  Response response = await dio.get(
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=6706f0d22b764f63a26c5843a0ac41d1&category=$category');
  Map<String, dynamic> jsonData = response.data;
  List<dynamic> articles = jsonData['articles'];
  List<ArticleModel> articlesList = [];
  for (var article in articles) {
    ArticleModel articleModel = ArticleModel(
        image: article['urlToImage'],
        title: article['title'],
        subTitle: article['description']);
    articlesList.add(articleModel);
  }
  return articlesList;
}catch (e) {
  return [];
}
  }
}
