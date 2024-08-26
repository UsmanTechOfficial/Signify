import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'domain/consts/global_var.dart';
import 'infrastructure/dal/services/bindings/service_locator.dart';
import 'infrastructure/navigation/app_routes/navigation.dart';
import 'infrastructure/navigation/app_routes/routes.dart';
import 'infrastructure/theme/theme.dart';

void main() async {
  await GetStorage.init();
  ServiceLocator();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'DynoSign',
      theme: AppTheme.instance.light,
      // darkTheme: AppTheme.instance.dark,
      // themeMode: ThemeMode.system,
      onGenerateRoute: AppPages.onGenerateRoute,
      scaffoldMessengerKey: scaffoldMessengerKey,
      initialRoute: Routes.ONBOARDING,
      navigatorKey: navigatorKey,
    );
  }
}
