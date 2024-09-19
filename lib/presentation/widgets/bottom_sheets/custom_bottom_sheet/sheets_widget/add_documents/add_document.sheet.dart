import 'package:dyno_sign/domain/consts/extention_methods.dart';
import 'package:flutter/material.dart';

import '../../../../../../assets_gen/assets.gen.dart';
import '../../../../../../domain/consts/consts.dart';
import '../../../../widgets.dart';

class AddDocumentSheet extends StatelessWidget {
  final void Function(DocumentSource index) onTap;

  const AddDocumentSheet({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: DocumentSource.values.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 30,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (context, index) {
            final docType = DocumentSource.values[index];

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    onTap(docType);
                  },
                  borderRadius: BorderRadius.circular(30),
                  splashColor: color.primary.withOpacity(0.2),
                  child: CircleAvatar(
                    radius: 20, // Smaller size for CircleAvatar
                    backgroundColor: color.primary.withOpacity(0.1),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Assets.icons.docIcon.svg(
                        colorFilter: ColorFilter.mode(
                          color.primary,
                          BlendMode.srcIn,
                        ),
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
                    color: color.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 20),
        const Text(
          'Recent Documents',
          style: TextStyle(
            fontSize: 16, // Adjusted font size
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        const Center(
          child: CustomText("No Recent Document Found"),
        )
        // ListView.builder(
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        //   // Disable internal scrolling
        //   itemCount: 10,
        //   itemBuilder: (context, index) {
        //     return ListTile(
        //       title: Text('recentDocuments[index]'),
        //       onTap: () {
        //         // Handle recent document tap
        //       },
        //     );
        //   },
        // ),
      ],
    );
  }
}

enum DocumentSource {
  camera,
  gallery,
  files,
  library,
}
