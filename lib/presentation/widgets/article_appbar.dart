import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/presentation/journeys/search/search_page.dart';
import 'package:news_app/presentation/widgets/logo.dart';

class ArticleAppBar extends StatelessWidget {
  final BuildContext providerContext;

  const ArticleAppBar({Key key, @required this.providerContext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
                builder: (context) =>
                    SearchPage(providerContext: providerContext),
              ),
            );
          },
          icon: Icon(
            EvaIcons.searchOutline,
            size: 20.0,
          ),
        ),
      ],
    );
  }
}
