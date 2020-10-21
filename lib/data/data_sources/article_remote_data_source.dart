import 'package:flutter/material.dart';
import 'package:news_app/data/core/api_client.dart';
import 'package:news_app/data/core/api_constants.dart';
import 'package:news_app/data/models/articles_model.dart';
import 'package:news_app/data/models/articles_result_model.dart';

abstract class ArticleRemoteDataSource {
  Future<List<ArticleModel>> getHotNews();
  Future<List<ArticleModel>> getHeadlines();
  Future<List<ArticleModel>> getSports();
  Future<List<ArticleModel>> getHealth();
  Future<List<ArticleModel>> getSearchResult({@required String keyword});
}

class ArticleRemoteDataSourceImpl extends ArticleRemoteDataSource {
  final ApiClient _client;

  ArticleRemoteDataSourceImpl(this._client);

  @override
  Future<List<ArticleModel>> getHotNews() async {
    final response = await _client.get(
      "${ApiConstants.BASE_URL}top-headlines?country=us&apiKey=${ApiConstants.API_KEY}",
    );
    final articles = ArticlesResultModel.fromJson(response).article;
    print(articles);
    return articles;
  }

  @override
  Future<List<ArticleModel>> getSearchResult({@required String keyword}) async {
    final response = await _client.get(
      "${ApiConstants.BASE_URL}top-headlines?q=$keyword&apiKey=${ApiConstants.API_KEY}",
    );
    final articles = ArticlesResultModel.fromJson(response).article;
    print(articles);
    return articles;
  }

  @override
  Future<List<ArticleModel>> getHeadlines() async {
    final response = await _client.get(
      "${ApiConstants.BASE_URL}everything?q=us&apiKey=${ApiConstants.API_KEY}",
    );
    final articles = ArticlesResultModel.fromJson(response).article;
    print(articles);
    return articles;
  }

  @override
  Future<List<ArticleModel>> getSports() async {
    final response = await _client.get(
      "${ApiConstants.BASE_URL}everything?q=sports&apiKey=${ApiConstants.API_KEY}",
    );
    final articles = ArticlesResultModel.fromJson(response).article;
    print(articles);
    return articles;
  }

  @override
  Future<List<ArticleModel>> getHealth() async {
    final response = await _client.get(
      "${ApiConstants.BASE_URL}everything?q=health&apiKey=${ApiConstants.API_KEY}",
    );
    final articles = ArticlesResultModel.fromJson(response).article;
    print(articles);
    return articles;
  }
}
