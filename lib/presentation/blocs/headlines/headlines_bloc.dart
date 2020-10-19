import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/entities/no_params.dart';
import 'package:news_app/domain/usecases/get_headlines.dart';

part 'headlines_event.dart';
part 'headlines_state.dart';

class HeadlinesBloc extends Bloc<HeadlinesEvent, HeadlinesState> {
  final GetHeadlines headlines;
  HeadlinesBloc({@required this.headlines}) : super(HeadlinesInitial());

  @override
  Stream<HeadlinesState> mapEventToState(
    HeadlinesEvent event,
  ) async* {
    if (event is HeadlinesLoadEvent) {
      final Either articlesEither = await headlines(NoParams());
      articlesEither.fold((l) => HeadlinesError(),
          (articles) => {HeadlinesLoaded(articles: articles)});
    }
  }
}
