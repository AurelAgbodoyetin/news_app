part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  final String currentTextFieldText;
  final List<ArticleEntity> articles;

  const SearchState({this.articles, this.currentTextFieldText});

  @override
  List<Object> get props => [];
}

class SerachInitial extends SearchState {}

class SearchTextFieldChangedState extends SearchState {
  const SearchTextFieldChangedState({String currentTextFieldText, articles})
      : super(currentTextFieldText: currentTextFieldText, articles: articles);
  @override
  List<Object> get props => [currentTextFieldText, articles];
}

class SearchResultsLoadErrorState extends SearchState {
  SearchResultsLoadErrorState({String currentTextFieldText})
      : super(currentTextFieldText: currentTextFieldText);
}
