import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/presentation/blocs/search/search_bloc.dart';
import 'package:news_app/presentation/journeys/search/search_page.dart';
import 'package:news_app/presentation/widgets/logo.dart';
import 'package:news_app/di/get_it.dart' as getItInstance;

class ArticleAppBar extends StatefulWidget {
  const ArticleAppBar({Key key}) : super(key: key);

  @override
  _ArticleAppBarState createState() => _ArticleAppBarState();
}

class _ArticleAppBarState extends State<ArticleAppBar> {
  SearchBloc searchBloc;

  @override
  void initState() {
    super.initState();
    searchBloc = getItInstance.getItInstance<SearchBloc>();
    print(searchBloc.currentTextFieldText);
  }

  @override
  void dispose() {
    super.dispose();
    searchBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => searchBloc,
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(
              'assets/svgs/menu.svg',
              color: Colors.black,
              height: 25.0,
            ),
          ),
          Expanded(
            child: const Logo(
              height: 20.0,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
            },
            icon: Icon(
              EvaIcons.searchOutline,
              size: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
