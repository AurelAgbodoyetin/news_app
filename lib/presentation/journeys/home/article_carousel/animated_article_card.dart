import 'package:flutter/material.dart';
import 'package:news_app/data/models/source_model.dart';
import 'package:news_app/presentation/journeys/home/article_carousel/article_card_widget.dart';

class AnimatedArticleCardWidget extends StatelessWidget {
  final int index;
  final PageController pageController;
  final String posterPath;
  final String title;
  final String publishedAt;
  final Source source;
  final String content;
  final String url;

  const AnimatedArticleCardWidget({
    Key key,
    @required this.index,
    @required this.pageController,
    @required this.posterPath,
    @required this.title,
    @required this.publishedAt,
    @required this.source,
    @required this.content,
    @required this.url,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              height: Curves.easeIn.transform(value) * 200,
              width: 250,
              child: child,
            ),
          );
        } else {
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              height:
                  Curves.easeIn.transform(index == 0 ? value : value * 0.5) *
                      200,
              width: 250,
              child: child,
            ),
          );
        }
      },
      child: ArticleCardWidget(
        posterPath: posterPath,
        title: title,
        publishedAt: publishedAt,
        source: source,
        content: content,
        url: url,
      ),
    );
  }
}
