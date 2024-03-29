import 'package:flutter/material.dart';
import 'package:news_app/app_constants.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool isSelected;

  const TabTitleWidget({Key key, this.title, this.onTap, this.isSelected})
      : assert(title != null, 'title should not be null'),
        assert(onTap != null, 'onTap should not be null'),
        assert(isSelected != null, 'isSelected should not be null'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColors.darkThemeColor : Colors.transparent,
              width: 3.0,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
        child: Text(
          title.toUpperCase(),
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: isSelected ? 20.0 : 15.0,
            letterSpacing: isSelected ? 1.8 : 0.4,
          ),
        ),
      ),
    );
  }
}
