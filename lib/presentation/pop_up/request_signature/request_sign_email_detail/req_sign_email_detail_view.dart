import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
import 'package:flutter/material.dart';

import '../../../../domain/consts/consts.dart';
import '../../../widgets/widgets.dart';
import '../request_sign_agreement_overview/req_sign_agreement_overview_view.dart';

class ReqSignEmailDetailView extends StatelessWidget {
  const ReqSignEmailDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final color = appColorScheme(context);
    final width = appWidth(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agreement Detail'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .05),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(), // Ensure it’s clamped to the viewport
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: CustomOutlinedTextButton(
                  onPressed: () {
                    Go.to(const ReqSignAgreementOverviewView());
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
              ),
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
              ),
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
                    shadowColor: color.shadow,
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppStyle.tileBorderRadius),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        // Ensure the row doesn’t take more space than needed
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            color: color.primary,
                            child: SizedBox(
                              width: 35,
                              height: 25,
                              child: Center(
                                child: CustomText(
                                  '0${index + 1}',
                                  fontSize: AppFontSize.labelMediumFont,
                                  color: color.surface,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8), // Space between the card and the CircleAvatar
                          CircleAvatar(
                            backgroundColor:
                                index.isEven ? color.primary : color.secondaryContainer,
                            child: const CustomText(
                              'A',
                              fontSize: AppFontSize.labelMediumFont,
                            ),
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
            ],
          ),
        ),
      ),
    );
  }
}
