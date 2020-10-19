import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/entities/no_params.dart';
import 'package:news_app/domain/usecases/get_hot_news.dart';

part 'article_carousel_event.dart';
part 'article_carousel_state.dart';

class ArticleCarouselBloc
    extends Bloc<ArticleCarouselEvent, ArticleCarouselState> {
  final GetHotNews hotNews;
  ArticleCarouselBloc({@required this.hotNews})
      : super(ArticleCarouselInitial());

  @override
  Stream<ArticleCarouselState> mapEventToState(
    ArticleCarouselEvent event,
  ) async* {
    if (event is CarouselLoadEvent) {
      final articlesEither = await hotNews(NoParams());
      yield articlesEither.fold((l) => ArticleCarouselError(), (articles) {
        return ArticleCarouselLoaded(
          articles: articles,
          defaultIndex: event.defaultIndex,
        );
      });
    }
  }
}
