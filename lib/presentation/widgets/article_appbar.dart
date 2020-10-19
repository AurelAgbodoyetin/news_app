import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/presentation/widgets/logo.dart';

class ArticleAppBar extends StatelessWidget {
  const ArticleAppBar({Key key}) : super(key: key);

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
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: Colors.black,
            size: 25.0,
          ),
        ),
      ],
    );
  }
}
