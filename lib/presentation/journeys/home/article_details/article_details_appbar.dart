import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ArticleDetailsAppBar extends StatelessWidget {
  final String title;

  const ArticleDetailsAppBar({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: [
          NeumorphicButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              boxShape: NeumorphicBoxShape.circle(),
              depth: 5.0,
            ),
            padding: const EdgeInsets.all(12.0),
            child: Icon(EvaIcons.arrowIosBackOutline),
          ),
          SizedBox(
            width: 30.0,
          ),
          Expanded(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
