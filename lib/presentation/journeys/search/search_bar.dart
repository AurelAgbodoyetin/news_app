import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:news_app/app_constants.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  FocusNode _textFieldFocus = FocusNode();
  TextEditingController _textFieldController = TextEditingController();

  NeumorphicStyle _isNotTypingStyle = NeumorphicStyle(
    boxShape: NeumorphicBoxShape.stadium(),
    shape: NeumorphicShape.convex,
    depth: 2.0,
  );

  NeumorphicStyle _isTypingStyle = NeumorphicStyle(
    boxShape: NeumorphicBoxShape.stadium(),
    shape: NeumorphicShape.concave,
    depth: -10.0,
  );

  NeumorphicStyle _currentStyle = NeumorphicStyle(
    boxShape: NeumorphicBoxShape.stadium(),
    shape: NeumorphicShape.convex,
    depth: 2.0,
  );
  @override
  void initState() {
    super.initState();
    _textFieldFocus.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    print("Focus: " + _textFieldFocus.hasFocus.toString());
    if (_textFieldFocus.hasFocus) {
      setState(() {
        _currentStyle = _isTypingStyle;
      });
    } else {
      setState(() {
        _currentStyle = _isNotTypingStyle;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      style: _currentStyle,
      child: TextField(
        focusNode: _textFieldFocus,
        controller: _textFieldController,
        cursorHeight: 25.0,
        decoration: InputDecoration(
          prefixIcon: Icon(
            EvaIcons.searchOutline,
            color: AppColors.darkThemeColor,
            size: 18.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
