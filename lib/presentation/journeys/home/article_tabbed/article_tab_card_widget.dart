import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:news_app/app_constants.dart';
import 'package:news_app/data/models/source_model.dart';
import 'package:news_app/presentation/journeys/home/article_details/article_details_page.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleTabCard extends StatelessWidget {
  final String posterPath;
  final String title;
  final String publishedAt;
  final Source source;
  final String content;
  final String url;

  const ArticleTabCard({
    Key key,
    @required this.posterPath,
    @required this.title,
    @required this.publishedAt,
    @required this.source,
    @required this.content,
    @required this.url,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          width: _width * 0.4,
          child: Column(
            children: [
              (posterPath == null || posterPath == "")
                  ? Image(
                      height: 80.0,
                      //width: 20.0,
                      image: AssetImage(
                        "assets/pngs/default.png",
                      ),
                      fit: BoxFit.cover,
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                      child: CachedNetworkImage(
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: Container(
                            height: 20.0,
                            width: 20.0,
                            child: CircularProgressIndicator(
                              backgroundColor: AppColors.darkThemeColor,
                              strokeWidth: 3.0,
                              value: downloadProgress.progress,
                            ),
                          ),
                        ),
                        imageUrl: posterPath,
                        height: 75.0,
                        width: _width * 0.5,
                        fit: BoxFit.cover,
                      ),
                    ),
              SizedBox(
                height: 7.0,
              ),
              Expanded(
                child: Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 5.0, left: 8.0, right: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Container(
                            height: 60,
                            child: Column(
                              children: [
                                Text(
                                  title,
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 7.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 3.0,
                              width: 50.0,
                              color: Colors.black,
                            )
                          ],
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
                                    color: Colors.black54,
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
                                    color: Colors.black54,
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
