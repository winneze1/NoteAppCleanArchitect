import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

void snackBarError({String? msg, GlobalKey<ScaffoldState>? scaffoldState}) {
  scaffoldState!.currentState!.showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$msg'),
          Icon(FontAwesome.weibo)
        ],
      ),
    )
  );
}