import 'package:dyno_sign/domain/consts/styles.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/routes.dart';
import 'package:flutter/material.dart';

import '../../../../domain/consts/font_size.dart';
import '../../../../domain/consts/global_var.dart';
import '../../../widgets/buttons/custom_outlined_text_button.dart';
import '../../../widgets/form_field/custom_formfield.dart';
import '../../../widgets/text/custom_text.dart';

class EmailDetailView extends StatelessWidget {
  const EmailDetailView({super.key});

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
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomOutlinedTextButton(
                    onPressed: () {
                      Go.toNamed(Routes.AGREEMENT_OVERVIEW);
                    },
                    text: 'Send',
                    borderRadius: AppStyle.outlinedBtnRadius,
                  ),
                ),
                const CustomText(
                  "Email Details",
                  fontSize: AppFontSize.titleXSmallFont,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 20),
                const CustomText(
                  'Enter',
                  fontSize: AppFontSize.titleXSmallFont,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 5),
                CustomTextFormField(
                    hint: "Enter email Address",
                    controller: TextEditingController(),
                    borderColor: color.outlineVariant,
                    borderRadius: AppStyle.buttonBorderRadius,
                    onFieldSubmitted: (value) => {},
                    focusNode: FocusNode()),
                const SizedBox(height: 20),
                const CustomText(
                  'Message',
                  fontSize: AppFontSize.titleXSmallFont,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 5),
                CustomTextFormField(
                    hint: "Write Message",
                    controller: TextEditingController(),
                    borderColor: color.outlineVariant,
                    borderRadius: AppStyle.buttonBorderRadius,
                    onFieldSubmitted: (value) => {},
                    maxLines: 5,
                    focusNode: FocusNode()),
                const SizedBox(height: 30),
                const CustomText(
                  "Recipient List",
                  fontSize: AppFontSize.titleXSmallFont,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 20),
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
                              leading: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 35,
                                    child: Card(
                                      color: color.primary,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(AppStyle.outlinedBtnRadius)),
                                      child: Center(
                                        child: CustomText(
                                          '${index + 1}',
                                          textAlign: TextAlign.center,
                                          fontWeight: FontWeight.w600,
                                          color: color.surface,
                                          fontSize: AppFontSize.labelXMediumFont,
                                        ),
                                      ),
                                    ),
                                  ),
                                  CircleAvatar(
                                    backgroundColor:
                                        index.isEven ? color.primary : color.primaryContainer,
                                    child: const CustomText(
                                      'A',
                                      fontSize: AppFontSize.labelMediumFont,
                                    ), // Placeholder for your icon
                                  ),
                                ],
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
                                if (value == 0) {}
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
              ],
            ),
          ),
        ));
  }
}
