import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:news_app/app_constants.dart';
import 'package:news_app/domain/entities/app_error.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/entities/no_params.dart';
import 'package:news_app/domain/usecases/get_headlines.dart';
import 'package:news_app/domain/usecases/get_hot_news.dart';
import 'package:news_app/presentation/journeys/home/home_screen.dart';
import 'package:pedantic/pedantic.dart';
import 'package:news_app/di/get_it.dart' as getIt;

void main() async {
  unawaited(getIt.init());
  GetHotNews hotNews = getIt.getItInstance<GetHotNews>();
  GetHeadlines headlines = getIt.getItInstance<GetHeadlines>();

  final Either<AppError, List<ArticleEntity>> eitherHotResponse =
      await hotNews(NoParams());
  eitherHotResponse.fold((l) {
    print("ERROR");
    print(l);
  }, (r) {
    print("LIST OF ARTICLES");
    print(r);
  });
  final Either<AppError, List<ArticleEntity>> eitherHeadResponse =
      await headlines(NoParams());
  eitherHeadResponse.fold((l) {
    print("ERROR");
    print(l);
  }, (r) {
    print("LIST OF ARTICLES");
    print(r);
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Bee News',
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        baseColor: AppColors.lightThemeColor,
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      darkTheme: NeumorphicThemeData(
        baseColor: AppColors.darkThemeColor,
        lightSource: LightSource.topLeft,
        depth: 6,
      ),
      home: Home(),
    );
  }
}
