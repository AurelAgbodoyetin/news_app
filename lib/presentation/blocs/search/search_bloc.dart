import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:news_app/domain/entities/app_error.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/entities/search_params.dart';
import 'package:news_app/domain/usecases/get_search_result.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchResult getSearchResult;
  SearchBloc({@required this.getSearchResult}) : super(SerachInitial());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchTextFieldChangedEvent) {
      Either<AppError, List<ArticleEntity>> articlesEither;
      articlesEither = await getSearchResult(
        SearchParams(keyword: event.currentTextFieldText),
      );
      yield articlesEither.fold(
        (l) => SearchResultsLoadErrorState(
            currentTextFieldText: event.currentTextFieldText),
        (articles) => SearchTextFieldChangedState(
          articles: articles,
          currentTextFieldText: event.currentTextFieldText,
        ),
      );
    }
  }
}
