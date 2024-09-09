import 'package:dyno_sign/domain/consts/extention_methods.dart';
import 'package:flutter/material.dart';

import '../../../../../../assets_gen/assets.gen.dart';

class AddDocumentSheet extends StatelessWidget {
  final VoidCallback onTap;

  const AddDocumentSheet({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: DocumentSource.values.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // 4 items per row
          mainAxisSpacing: 10, // Spacing between rows
          crossAxisSpacing: 30, // Spacing between columns
          childAspectRatio: 1.0, // Adjust aspect ratio for square-like cells
        ),
        itemBuilder: (context, index) {
          final docType = DocumentSource.values[index];

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(30),
                splashColor: colorScheme.primary.withOpacity(0.2),
                child: CircleAvatar(
                  radius: 20, // Smaller size for CircleAvatar
                  backgroundColor: colorScheme.primary.withOpacity(0.1),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Assets.icons.docIcon.svg(
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                docType.name.capitalizeFirst(),
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}

enum DocumentSource {
  scan,
  camera,
  templates,
  gallery,
  drive,
  files,
  library,
  media,
}
