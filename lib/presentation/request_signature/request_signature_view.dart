import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/routes.dart';
import 'package:flutter/material.dart';

import '../widgets/buttons/custom_elevated_text_button.dart';

class RequestSignaturesView extends StatelessWidget {
  const RequestSignaturesView({super.key});

  @override
  Widget build(BuildContext context) {
    // final color = appColorScheme(context);
    // final height = appHeight(context);
    // final width = appWidth(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('RequestSignature'),
      ),
      body: Center(
        child: CustomElevatedTextButton(
          text: 'Welcome to RequestSignature Page',
          onPressed: () {
            Go.toNamed(Routes.SELECTED_DOCUMENT);
          },
        ),
      ),
    );
  }
}
