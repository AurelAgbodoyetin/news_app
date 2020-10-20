import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:news_app/domain/entities/app_error.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/entities/no_params.dart';
import 'package:news_app/domain/usecases/get_headlines.dart';
import 'package:news_app/domain/usecases/get_health.dart';
import 'package:news_app/domain/usecases/get_sports.dart';

part 'article_tabbed_event.dart';
part 'article_tabbed_state.dart';

class ArticleTabbedBloc extends Bloc<ArticleTabbedEvent, ArticleTabbedState> {
  final GetHeadlines getHeadlines;
  final GetSports getSports;
  final GetHealth getHealth;
  ArticleTabbedBloc({
    @required this.getHealth,
    @required this.getHeadlines,
    @required this.getSports,
  }) : super(ArticleTabbedInitial());

  @override
  Stream<ArticleTabbedState> mapEventToState(
    ArticleTabbedEvent event,
  ) async* {
    if (event is ArticleTabChangedEvent) {
      Either<AppError, List<ArticleEntity>> articlesEither;
      switch (event.currentTabIndex) {
        case 0:
          articlesEither = await getHeadlines(NoParams());
          break;

        case 1:
          articlesEither = await getHealth(NoParams());
          break;
        case 2:
          articlesEither = await getSports(NoParams());
          break;
      }
      yield articlesEither.fold(
        (l) => ArticleTabLoadErrorState(currentTabIndex: event.currentTabIndex),
        (articles) => ArticleTabChangedState(
            currentTabIndex: event.currentTabIndex, articles: articles),
      );
    }
  }
}
