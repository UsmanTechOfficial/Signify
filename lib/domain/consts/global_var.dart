import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

ColorScheme appColorScheme(context) => Theme.of(context).colorScheme;

TextTheme appTextTheme(context) => Theme.of(context).textTheme;

double appHeight(context) => MediaQuery.sizeOf(context).height;

double appWidth(context) => MediaQuery.sizeOf(context).width;

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

final navigatorKey = GlobalKey<NavigatorState>();

final getIt = GetIt.instance;

final GetStorage getStorage = GetStorage();
