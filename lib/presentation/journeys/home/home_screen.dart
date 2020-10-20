import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:news_app/presentation/blocs/article_carousel/article_carousel_bloc.dart';
import 'package:news_app/presentation/blocs/article_tabbed/article_tabbed_bloc.dart';
import 'package:news_app/presentation/journeys/home/article_carousel/article_carousel_widget.dart';
import 'package:news_app/di/get_it.dart' as getItInstance;
import 'package:news_app/presentation/journeys/home/article_tabbed/article_tabbed_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ArticleCarouselBloc carouselBloc;
  ArticleTabbedBloc articleTabbedBloc;

  @override
  void initState() {
    super.initState();
    carouselBloc = getItInstance.getItInstance<ArticleCarouselBloc>();
    carouselBloc.add(CarouselLoadEvent());
    articleTabbedBloc = getItInstance.getItInstance<ArticleTabbedBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    carouselBloc?.close();
    articleTabbedBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => carouselBloc),
        BlocProvider(create: (context) => articleTabbedBloc),
      ],
      child: Scaffold(
        body: BlocBuilder<ArticleCarouselBloc, ArticleCarouselState>(
          cubit: carouselBloc,
          builder: (context, state) {
            if (state is ArticleCarouselLoaded) {
              return Column(
                children: [
                  ArticleCarouselWidget(
                    articles: state.articles,
                    defaultIndex: state.defaultIndex,
                  ),
                  Expanded(
                    child: ArticleTabbedWidget(),
                  )
                ],
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
