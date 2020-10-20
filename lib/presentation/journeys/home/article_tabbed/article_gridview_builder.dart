import 'package:flutter/material.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/presentation/journeys/home/article_tabbed/article_tab_card_widget.dart';

class ArticleGridViewBuilder extends StatelessWidget {
  final List<ArticleEntity> articles;

  const ArticleGridViewBuilder({Key key, @required this.articles})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: articles.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemBuilder: (context, index) {
          final ArticleEntity article = articles[index];
          return ArticleTabCard(
            posterPath: article.urlToImage,
            title: article.title,
            publishedAt: article.publishedAt,
            source: article.source,
            content: article.content,
            url: article.url,
          );
        },
      ),
    );
  }
}
