import 'package:dyno_sign/infrastructure/navigation/injection_container/injection.container.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'domain/consts/global_var.dart';
import 'infrastructure/dal/services/service_locator.dart';
import 'infrastructure/navigation/app_routes/navigation.dart';
import 'infrastructure/navigation/app_routes/routes.dart';
import 'infrastructure/theme/app_theme.dart';

void main() async {
  await GetStorage.init();
  await ServiceLocator.init();
  await InjectionContainer.init();
  runApp(
    const Main(),
  );
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DynoSign',
      theme: AppTheme.instance.light,
      darkTheme: AppTheme.instance.dark,
      themeMode: ThemeMode.light,
      onGenerateRoute: AppPages.onGenerateRoute,
      scaffoldMessengerKey: scaffoldMessengerKey,
      initialRoute: Routes.DASHBOARD,
      navigatorKey: navigatorKey,
    );
  }
}
