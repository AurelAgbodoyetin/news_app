part of 'article_tabbed_bloc.dart';

abstract class ArticleTabbedState extends Equatable {
  final int currentTabIndex;
  const ArticleTabbedState({this.currentTabIndex});

  @override
  List<Object> get props => [currentTabIndex];
}

class ArticleTabbedInitial extends ArticleTabbedState {}

class ArticleTabChangedState extends ArticleTabbedState {
  final List<ArticleEntity> articles;

  const ArticleTabChangedState({int currentTabIndex, this.articles})
      : super(currentTabIndex: currentTabIndex);

  @override
  List<Object> get props => [currentTabIndex, articles];
}

class ArticleTabLoadErrorState extends ArticleTabbedState {
  ArticleTabLoadErrorState({int currentTabIndex})
      : super(currentTabIndex: currentTabIndex);
}
