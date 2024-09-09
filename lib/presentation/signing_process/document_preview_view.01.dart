import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/routes.dart';
import 'package:dyno_sign/presentation/widgets/buttons/custom_outlined_text_button.dart';
import 'package:flutter/material.dart';

class DocumentPreviewView extends StatelessWidget {
  const DocumentPreviewView({super.key});

  @override
  Widget build(BuildContext context) {
    // final color = appColorScheme(context);
    // final bloc = context.read<DocumentPreviewBloc>();
    // final height = appHeight(context);
    // final width = appWidth(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('DocumentPreview'),
        actions: [
          CustomOutlinedTextButton(
            text: 'Next',
            onPressed: () {
              Go.toNamed(Routes.SELECTED_DOCUMENT);
            },
          )
        ],
      ),
      body: const Center(
        child: Text('Welcome to DocumentPreview Page'),
      ),
    );
  }
}