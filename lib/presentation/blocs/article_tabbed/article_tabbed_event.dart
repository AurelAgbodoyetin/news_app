part of 'article_tabbed_bloc.dart';

abstract class ArticleTabbedEvent extends Equatable {
  const ArticleTabbedEvent();

  @override
  List<Object> get props => [];
}

class ArticleTabChangedEvent extends ArticleTabbedEvent {
  final int currentTabIndex;

  const ArticleTabChangedEvent({this.currentTabIndex = 0});

  @override
  List<Object> get props => [currentTabIndex];
}
