import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:news_app/app_constants.dart';
import 'package:news_app/data/models/source_model.dart';
import 'package:news_app/presentation/journeys/home/article_details/article_details_page.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleCardWidget extends StatelessWidget {
  //final int movieId;
  //Todo Id for the articles
  final String posterPath;
  final String title;
  final String publishedAt;
  final Source source;
  final String content;
  final String url;

  const ArticleCardWidget({
    Key key,
    //@required this.movieId,
    @required this.posterPath,
    @required this.title,
    @required this.publishedAt,
    @required this.source,
    @required this.content,
    @required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        depth: 10.0,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleDetails(
                title: title,
                content: content,
                sourceName: source.name,
                url: url,
                imgUrl: posterPath,
                publishedAt: publishedAt,
              ),
            ),
          );
        },
        child: Container(
          height: 200.0,
          width: 250.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: AppColors.lightThemeColor,
          ),
          child: Column(
            children: [
              Container(
                height: 100.0,
                width: 250.0,
                child: (posterPath == null)
                    ? Image(
                        image: AssetImage(
                          "assets/pngs/default.png",
                        ),
                        fit: BoxFit.cover,
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0)),
                        child: CachedNetworkImage(
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              child: CircularProgressIndicator(
                                backgroundColor: AppColors.darkThemeColor,
                                strokeWidth: 3.0,
                                value: downloadProgress.progress,
                              ),
                            ),
                          ),
                          imageUrl: '$posterPath',
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 5.0, left: 8.0, right: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Container(
                            height: 60,
                            child: Text(
                              title,
                              maxLines: 3,
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          height: 13.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  source.name,
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                child: Text(
                                  timeago.format(
                                    DateTime.parse(publishedAt),
                                    allowFromNow: true,
                                    locale: 'en',
                                  ),
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
