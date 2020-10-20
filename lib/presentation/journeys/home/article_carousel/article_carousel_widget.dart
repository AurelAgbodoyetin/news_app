import 'package:flutter/material.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/presentation/journeys/home/article_carousel/article_page_view.dart';
import 'package:news_app/presentation/widgets/article_appbar.dart';

class ArticleCarouselWidget extends StatelessWidget {
  final List<ArticleEntity> articles;
  final int defaultIndex;

  const ArticleCarouselWidget(
      {Key key, @required this.articles, @required this.defaultIndex})
      : assert(defaultIndex >= 0, 'defaultIndex can not be less than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ArticleAppBar(),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "Hot News".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              ArticlePageView(
                articles: articles,
                initialPage: defaultIndex,
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "Headlines".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
            ],
          )),
    );
  }
}
