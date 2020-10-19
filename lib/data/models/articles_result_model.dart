import 'package:news_app/data/models/articles_model.dart';

class ArticlesResultModel {
  String status;
  int totalResults;
  List<ArticleModel> article;

  ArticlesResultModel({this.status, this.totalResults, this.article});

  ArticlesResultModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      article = new List<ArticleModel>();
      json['articles'].forEach((v) {
        article.add(new ArticleModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    if (this.article != null) {
      data['articles'] = this.article.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
