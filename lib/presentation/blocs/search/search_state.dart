part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  final String currentTextFieldText;
  const SearchState({this.currentTextFieldText});

  @override
  List<Object> get props => [];
}

class SerachInitial extends SearchState {}

class SearchTextFieldChangedState extends SearchState {
  final List<ArticleEntity> articles;

  const SearchTextFieldChangedState(
      {String currentTextFieldText, this.articles})
      : super(currentTextFieldText: currentTextFieldText);
  @override
  List<Object> get props => [currentTextFieldText, articles];
}

class SearchResultsLoadErrorState extends SearchState {
  SearchResultsLoadErrorState({String currentTextFieldText})
      : super(currentTextFieldText: currentTextFieldText);
}
