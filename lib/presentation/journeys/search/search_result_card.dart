import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:news_app/app_constants.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/presentation/journeys/home/article_details/article_details_page.dart';
import 'package:timeago/timeago.dart' as timeago;

class SearchResultCard extends StatelessWidget {
  final ArticleEntity article;

  const SearchResultCard({Key key, this.article}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetails(
              title: article.title,
              content: article.content,
              sourceName: article.source.name,
              url: article.url,
              imgUrl: article.urlToImage,
              publishedAt: article.publishedAt,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 7.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.darkThemeColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    article.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Text(
                    timeago.format(
                      DateTime.parse(article.publishedAt),
                      allowFromNow: true,
                      locale: 'en',
                    ),
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Container(
              height: 100.0,
              width: 100.0,
              child: (article.urlToImage == null || article.urlToImage == "")
                  ? Image(
                      image: AssetImage(
                        "assets/pngs/default.png",
                      ),
                      fit: BoxFit.cover,
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      child: CachedNetworkImage(
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            child: CircularProgressIndicator(
                              backgroundColor: AppColors.darkThemeColor,
                              strokeWidth: 3.0,
                              value: downloadProgress.progress,
                            ),
                          ),
                        ),
                        imageUrl: article.urlToImage,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
