import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/models/source_model.dart';

class ArticleEntity extends Equatable {
  final Source source;
  final String publishedAt;
  final String title;
  final String description;
  final String content;
  final String url;
  final String urlToImage;

  ArticleEntity({
    @required this.source,
    @required this.publishedAt,
    @required this.title,
    @required this.description,
    @required this.content,
    @required this.url,
    @required this.urlToImage,
  });

  @override
  List<Object> get props => [title, url];

  @override
  bool get stringify => true;
}

ArticleEntity test = ArticleEntity(
    source: Source(id: "cnn", name: "CNN"),
    publishedAt: "2020-10-15T03:42:00Z",
    title:
        "Thailand announces emergency decree to quell pro-democracy protests - CNN",
    description:
        "Compressing simple molecular solids with hydrogen at extremely high pressures, University of Rochester engineers and physicists have, for the first time, created material that is superconducting at room temperature. Featured as the cover story in the journal …",
    content:
        "The goal of new research led by Ranga Dias, assistant professor of mechanical engineering and of physics and astronomy, is to develop superconducting materials at room temperatures. Currently, extrem… [+7478 chars]",
    url:
        "https://www.cnn.com/2020/10/14/asia/thailand-emergency-decree-protests-intl-hnk/index.html",
    urlToImage:
        "https://cdn.cnn.com/cnnnext/dam/assets/201014220400-02-thailand-pro-democracy-protests-restricted-super-tease.jpg");
