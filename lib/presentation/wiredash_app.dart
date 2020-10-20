import 'package:flutter/material.dart';
import 'package:news_app/app_constants.dart';
import 'package:wiredash/wiredash.dart';

class WiredashApp extends StatelessWidget {
  final navigatorKey;
  final Widget child;

  const WiredashApp({
    Key key,
    @required this.navigatorKey,
    @required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Wiredash(
      navigatorKey: navigatorKey,
      projectId: "newsapp-b9klr1d",
      secret: "kp27w40jgrs8cwivupi7jhcs3gl7yiis",
      child: child,
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        dividerColor: AppColors.foregroundColor,
        primaryColor: AppColors.darkThemeColor,
        secondaryColor: AppColors.lightThemeColor,
      ),
    );
  }
}
