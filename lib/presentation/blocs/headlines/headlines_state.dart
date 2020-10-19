part of 'headlines_bloc.dart';

abstract class HeadlinesState extends Equatable {
  const HeadlinesState();

  @override
  List<Object> get props => [];
}

class HeadlinesInitial extends HeadlinesState {}

class HeadlinesError extends HeadlinesState {}

class HeadlinesLoaded extends HeadlinesState {
  final List<ArticleEntity> articles;

  HeadlinesLoaded({this.articles});

  @override
  List<Object> get props => [articles];
}
