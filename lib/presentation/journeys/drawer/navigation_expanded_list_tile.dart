import 'package:flutter/material.dart';
import 'package:news_app/app_constants.dart';
import 'package:news_app/presentation/journeys/drawer/navigation_list_item.dart';

class NavigationExpandedListItem extends StatelessWidget {
  final String title;
  final List<String> children;
  final Function onPressed;

  const NavigationExpandedListItem({
    Key key,
    @required this.title,
    @required this.onPressed,
    @required this.children,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.darkThemeColor.withOpacity(0.7),
              blurRadius: 2.0,
            )
          ],
        ),
        child: ExpansionTile(
          title: Text(
            title.toUpperCase(),
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: [
            for (int i = 0; i < children.length; i++)
              NavigationSubListItem(
                  title: children[i],
                  trailing: SizedBox.shrink(),
                  onPressed: () {})
          ],
        ),
      ),
    );
  }
}
