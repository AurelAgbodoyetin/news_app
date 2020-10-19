part of 'article_carousel_bloc.dart';

abstract class ArticleCarouselEvent extends Equatable {
  const ArticleCarouselEvent();

  @override
  List<Object> get props => [];
}

class CarouselLoadEvent extends ArticleCarouselEvent {
  final int defaultIndex;

  CarouselLoadEvent({this.defaultIndex = 0})
      : assert(defaultIndex >= 0, 'defaultIndex can not be less than 0');
  @override
  List<Object> get props => [defaultIndex];
}
