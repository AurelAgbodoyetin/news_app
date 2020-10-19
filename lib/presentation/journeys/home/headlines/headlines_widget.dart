import 'package:flutter/material.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/presentation/journeys/home/headlines/headline_article_card_widget.dart';

class HeadlinesWidget extends StatefulWidget {
  final List<ArticleEntity> articles;
  HeadlinesWidget({Key key, @required this.articles}) : super(key: key);

  @override
  _HeadlinesWidgetState createState() => _HeadlinesWidgetState();
}

class _HeadlinesWidgetState extends State<HeadlinesWidget> {
  List<Widget> cardList = [];

  _buildArticlesCards(List<ArticleEntity> articles) {
    articles.forEach((article) {
      cardList.add(
        HeadlineArticleCard(
          source: article.source,
          title: article.title,
          posterPath: article.urlToImage,
          publishedAt: article.publishedAt,
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _buildArticlesCards(widget.articles);
  }

  @override
  Widget build(BuildContext context) {
    //double _width = MediaQuery.of(context).size.width;
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10,
      ),
      delegate: SliverChildListDelegate(cardList),
      /*itemBuilder: (BuildContext context, int index) {
        final ArticleEntity article = articles[index];
        return HeadlineArticleCard(
          source: article.source,
          title: article.title,
          posterPath: article.urlToImage,
          publishedAt: article.publishedAt,
        );
      },*/
    );
  }
}
