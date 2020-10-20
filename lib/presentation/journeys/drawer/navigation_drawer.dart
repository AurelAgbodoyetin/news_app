import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app_constants.dart';
import 'package:news_app/presentation/journeys/drawer/navigation_expanded_list_tile.dart';
import 'package:news_app/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:news_app/presentation/widgets/app_dialog.dart';
import 'package:news_app/presentation/widgets/logo.dart';
import 'package:wiredash/wiredash.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.75,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.darkThemeColor.withOpacity(0.7),
            blurRadius: 4.0,
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                top: 15.0,
                bottom: 60.0,
              ),
              child: Logo(height: 50),
            ),
            NavigationListItem(
              title: "Saved articles",
              trailing: Icon(
                EvaIcons.bookmarkOutline,
                color: Colors.white.withOpacity(0.7),
                size: 25.0,
              ),
              onPressed: () {},
            ),
            NavigationExpandedListItem(
              title: "Language",
              children: ["English", "French"],
              onPressed: () {},
            ),
            NavigationListItem(
              title: "Feedback",
              trailing: Icon(
                EvaIcons.messageSquareOutline,
                color: Colors.white.withOpacity(0.7),
                size: 25.0,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Wiredash.of(context).show();
              },
            ),
            NavigationListItem(
              title: "About",
              trailing: Icon(
                EvaIcons.bookOutline,
                color: Colors.white.withOpacity(0.7),
                size: 25.0,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                _shoxDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _shoxDialog(BuildContext context) {
    showDialog(
        context: context,
        child: AppDialog(
          title: "About",
          description:
              "This product uses the NewsAPI but is not endorsed or certified by NewsAPI. This app is developed for education purpose. You can make a feedback to request a feature and also help me to improve my skills as Flutter developer.",
          buttonText: "Okay",
          image: Image.asset(
            "assets/pngs/news_api.png",
            height: 80.0,
          ),
        ));
  }
}
