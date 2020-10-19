part of 'article_carousel_bloc.dart';

abstract class ArticleCarouselState extends Equatable {
  const ArticleCarouselState();

  @override
  List<Object> get props => [];
}

class ArticleCarouselInitial extends ArticleCarouselState {}

class ArticleCarouselError extends ArticleCarouselState {}

class ArticleCarouselLoaded extends ArticleCarouselState {
  final List<ArticleEntity> articles;
  final int defaultIndex;

  ArticleCarouselLoaded({this.articles, this.defaultIndex = 0})
      : assert(defaultIndex >= 0, 'defaultIndex can not be less than 0');

  @override
  List<Object> get props => [defaultIndex, articles];
}
