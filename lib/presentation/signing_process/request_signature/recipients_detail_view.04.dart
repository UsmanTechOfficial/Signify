import 'package:dyno_sign/domain/consts/app_consts/sign_process_types.dart';
import 'package:flutter/material.dart';

import '../../../domain/consts/consts.dart';
import '../../../infrastructure/navigation/app_routes/navigation.dart';
import '../../../infrastructure/navigation/app_routes/routes.dart';
import '../../widgets/widgets.dart';

class RecipientsDetailView extends StatelessWidget {
  final SignProcessTypes signProcessTypes;

  const RecipientsDetailView({super.key, required this.signProcessTypes});

  @override
  Widget build(BuildContext context) {
    final color = appColorScheme(context);
    // final height = appHeight(context);
    final width = appWidth(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Agreement Detail'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .05),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomOutlinedTextButton(
                    onPressed: () {
                      if (signProcessTypes == SignProcessTypes.requestSignatures) {
                        Go.toNamed(
                          Routes.ASSIGN_FIELDS,
                          arguments: {
                            'signProcessTypes': SignProcessTypes.requestSignatures,
                          },
                        );
                      }
                    },
                    text: 'Next',
                    borderRadius: AppStyle.outlinedBtnRadius,
                  ),
                ),
                ListTile(
                  title: const CustomText(
                    "Set Signing Order",
                    fontSize: AppFontSize.bodyMediumFont,
                    fontWeight: FontWeight.w500,
                  ),
                  trailing: Transform.scale(
                    scale: 0.8,
                    child: Switch.adaptive(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                ),
                const CustomText(
                  "Recipients List",
                  fontSize: AppFontSize.titleXSmallFont,
                  fontWeight: FontWeight.w500,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Card(
                      shadowColor: color.shadow,
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppStyle.tileBorderRadius),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        leading: CircleAvatar(
                          backgroundColor: index.isEven ? color.primary : color.secondaryContainer,
                          child: const CustomText(
                            'A',
                            fontSize: AppFontSize.labelMediumFont,
                          ),
                        ),
                        title: const CustomText(
                          "Amir",
                          fontSize: AppFontSize.titleXSmallFont,
                          fontWeight: FontWeight.w500,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              "amir@email.com",
                              fontSize: AppFontSize.labelSmallFont,
                              color: color.outline,
                            ),
                            CustomText(
                              'Needs to sign',
                              fontSize: AppFontSize.labelSmallFont,
                              color: color.outline,
                            ),
                          ],
                        ),
                        trailing: PopupMenuButton<int>(
                          icon: const Icon(Icons.more_vert_rounded),
                          onSelected: (value) {
                            if (value == 0) {
                              // controller.loadedFiles.removeAt(index);
                            }
                          },
                          itemBuilder: (BuildContext context) => [
                            const PopupMenuItem<int>(
                              value: 0,
                              child: Text('Delete'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: CustomElevatedTextButton(
                    width: double.maxFinite,
                    text: "Add Another Recipient",
                    borderRadius: AppStyle.buttonBorderRadius,
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
