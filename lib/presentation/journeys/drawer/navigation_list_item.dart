import 'package:flutter/material.dart';
import 'package:news_app/app_constants.dart';

class NavigationListItem extends StatelessWidget {
  final String title;
  final Widget trailing;
  final Function onPressed;

  const NavigationListItem({
    Key key,
    @required this.title,
    @required this.onPressed,
    this.trailing,
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
        child: ListTile(
          title: Text(
            title.toUpperCase(),
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: trailing,
        ),
      ),
    );
  }
}

class NavigationSubListItem extends StatelessWidget {
  final String title;
  final Widget trailing;
  final Function onPressed;

  const NavigationSubListItem({
    Key key,
    @required this.title,
    @required this.onPressed,
    this.trailing,
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
        child: ListTile(
          contentPadding: EdgeInsets.only(left: 50.0),
          title: Text(
            title.toUpperCase(),
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: trailing,
        ),
      ),
    );
  }
}
