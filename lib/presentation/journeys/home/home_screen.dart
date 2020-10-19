import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:news_app/presentation/blocs/article_carousel/article_carousel_bloc.dart';
import 'package:news_app/presentation/blocs/headlines/headlines_bloc.dart';
import 'package:news_app/presentation/journeys/home/article_carousel/article_carousel_widget.dart';
import 'package:news_app/di/get_it.dart' as getItInstance;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ArticleCarouselBloc carouselBloc;
  HeadlinesBloc headlinesBloc;

  @override
  void initState() {
    super.initState();
    carouselBloc = getItInstance.getItInstance<ArticleCarouselBloc>();
    headlinesBloc = getItInstance.getItInstance<HeadlinesBloc>();
    carouselBloc.add(CarouselLoadEvent());
    headlinesBloc.add(HeadlinesLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    carouselBloc?.close();
    headlinesBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => carouselBloc),
        BlocProvider(create: (context) => headlinesBloc)
      ],
      child: Scaffold(
        body: BlocBuilder<ArticleCarouselBloc, ArticleCarouselState>(
          cubit: carouselBloc,
          builder: (context, state) {
            if (state is ArticleCarouselLoaded) {
              return ArticleCarouselWidget(
                articles: state.articles,
                defaultIndex: state.defaultIndex,
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
