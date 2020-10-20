import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/presentation/blocs/article_tabbed/article_tabbed_bloc.dart';
import 'package:news_app/presentation/journeys/home/article_tabbed/article_gridview_builder.dart';
import 'package:news_app/presentation/journeys/home/article_tabbed/article_tabbed_constants.dart';
import 'package:news_app/presentation/journeys/home/article_tabbed/tab_title_widget.dart';

class ArticleTabbedWidget extends StatefulWidget {
  @override
  _ArticleTabbedWidgetState createState() => _ArticleTabbedWidgetState();
}

class _ArticleTabbedWidgetState extends State<ArticleTabbedWidget>
    with SingleTickerProviderStateMixin {
  ArticleTabbedBloc get articleTabbedBloc =>
      BlocProvider.of<ArticleTabbedBloc>(context);
  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    articleTabbedBloc
        .add(ArticleTabChangedEvent(currentTabIndex: currentTabIndex));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleTabbedBloc, ArticleTabbedState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0;
                      i < ArticleTabbedConstants.articleTabs.length;
                      i++)
                    TabTitleWidget(
                      title: ArticleTabbedConstants.articleTabs[i].title,
                      onTap: () => _onTabTapped(i),
                      isSelected: ArticleTabbedConstants.articleTabs[i].index ==
                          state.currentTabIndex,
                    )
                ],
              ),
              if (state is ArticleTabChangedState)
                Expanded(
                  child: ArticleGridViewBuilder(articles: state.articles),
                ),
            ],
          ),
        );
      },
    );
  }

  void _onTabTapped(int index) {
    articleTabbedBloc.add(
      ArticleTabChangedEvent(currentTabIndex: index),
    );
  }
}
