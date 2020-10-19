import 'package:flutter/material.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/presentation/journeys/home/article_carousel/animated_article_card.dart';

class ArticlePageView extends StatefulWidget {
  final List<ArticleEntity> articles;
  final int initialPage;

  const ArticlePageView(
      {Key key, @required this.articles, @required this.initialPage})
      : assert(initialPage >= 0, 'initialPage cannot be less than 0'),
        super(key: key);
  @override
  _ArticlePageViewState createState() => _ArticlePageViewState();
}

class _ArticlePageViewState extends State<ArticlePageView> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.initialPage,
      viewportFraction: 0.8,
      keepPage: false,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      height: 220.0,
      //color: Colors.amber,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final ArticleEntity article = widget.articles[index];
          return AnimatedArticleCardWidget(
            pageController: _pageController,
            index: index,
            posterPath: article.urlToImage,
            title: article.title,
            source: article.source,
            publishedAt: article.publishedAt,
          );
        },
        pageSnapping: true,
        itemCount: widget.articles?.length ?? 0,
      ),
    );
  }
}
