import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:news_app/app_constants.dart';

class AppDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Widget image;

  const AppDialog({
    Key key,
    @required this.title,
    @required this.description,
    @required this.buttonText,
    this.image,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.lightThemeColor,
      elevation: 10.0,
      insetPadding: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title.toUpperCase(),
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              description,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              child: image,
            ),
            SizedBox(height: 10.0),
            NeumorphicButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                //boxShape: NeumorphicBoxShape.circle(),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 7.0),
                    child: Text(
                      buttonText.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
