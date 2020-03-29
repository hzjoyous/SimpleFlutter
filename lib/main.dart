import 'package:flutter/material.dart';
import 'package:simpleflutter/home/home_screen.dart';
import 'package:simpleflutter/constants.dart' show AppColors;

void main() => runApp(MaterialApp(
    title: 'wechat',
    theme:
        ThemeData.light().copyWith(
          primaryColor: Color(AppColors.AppBarColor),
          cardColor: Color(AppColors.AppBarColor)
        ),
    home: HomeScreen()));
