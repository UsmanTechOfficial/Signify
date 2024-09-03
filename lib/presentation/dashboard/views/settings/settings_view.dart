import 'package:flutter/material.dart';

import '../../../../domain/consts/global_var.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              scaffoldKey.currentState?.openDrawer();
            },
            child: const Icon(Icons.menu_outlined)),
        title: const Text('Settings'),
      ),
      body: const Center(
        child: Text('Welcome to Settings Page'),
      ),
    );
  }
}
