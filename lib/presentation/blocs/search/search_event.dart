part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchTextFieldChangedEvent extends SearchEvent {
  final String currentTextFieldText;

  SearchTextFieldChangedEvent({this.currentTextFieldText})
      : assert(
            currentTextFieldText != null, "Search keyword could not be null");

  @override
  List<Object> get props => [currentTextFieldText];
}
