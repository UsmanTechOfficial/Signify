import 'package:flutter/material.dart';

ColorScheme appColorScheme(context) => Theme.of(context).colorScheme;

TextTheme appTextTheme(context) => Theme.of(context).textTheme;

double appHeight(context) => MediaQuery.sizeOf(context).height;

double appWidth(context) => MediaQuery.sizeOf(context).width;

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
