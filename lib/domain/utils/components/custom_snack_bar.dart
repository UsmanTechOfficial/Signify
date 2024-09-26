part of '../utils.dart';

class CSnackBar {
  static void show(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: AppFontSize.labelMediumFont,
          fontWeight: FontWeight.w400,
        ),
      ),
      width: appWidth(navigatorKey.currentContext) * .9,
      duration: const Duration(seconds: 2),
      backgroundColor: appColorScheme(navigatorKey.currentContext).primary.withOpacity(0.9),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 5,
    );

    scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }
}
