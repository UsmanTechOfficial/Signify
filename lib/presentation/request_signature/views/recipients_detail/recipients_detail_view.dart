import 'package:dyno_sign/domain/consts/styles.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/routes.dart';
import 'package:flutter/material.dart';
import '../../../../domain/consts/font_size.dart';
import '../../../../domain/consts/global_var.dart';
import '../../../../domain/custom_widgets/buttons/custom_elevated_text_button.dart';
import '../../../../domain/custom_widgets/buttons/custom_outlined_text_button.dart';
import '../../../../domain/custom_widgets/text/custom_text.dart';

class RecipientsDetailView extends StatelessWidget {
  const RecipientsDetailView({super.key});

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
                      Go.toNamed(Routes.ASSIGN_FIELDS);
                    },
                    text: 'Next',
                    borderRadius: AppStyle.outlinedBtnRadius,
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
                      child: Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: index.isEven
                                    ? color.primary
                                    : color.secondaryContainer,
                                child: const CustomText(
                                  'A',
                                  fontSize: AppFontSize.labelMediumFont,
                                ), // Placeholder for your icon
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
                                    // Update this as needed
                                    fontSize: AppFontSize.labelSmallFont,
                                    color: color.outline,
                                  ),
                                  CustomText(
                                    'Needs to sign',
                                    // Update this as needed
                                    fontSize: AppFontSize.labelSmallFont,
                                    color: color.outline,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          PopupMenuButton(
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
                                  ])
                        ],
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
