import 'package:flutter/material.dart';

import '../../domain/consts/app_consts/sign_process_types.dart';
import '../../domain/consts/consts.dart';
import '../../infrastructure/navigation/app_routes/navigation.dart';
import '../../infrastructure/navigation/app_routes/routes.dart';
import '../widgets/widgets.dart';

class AgreementDetailAddedView extends StatelessWidget {
  final SignProcessTypes signProcessTypes;

  const AgreementDetailAddedView({super.key, required this.signProcessTypes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agreement Detail'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .05),
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
                    if (signProcessTypes == SignProcessTypes.requestSignatures) {
                      Go.toNamed(
                        Routes.RECIPIENTS_DETAIL,
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
              const CustomText(
                "Agreement Details",
                fontSize: AppFontSize.titleXSmallFont,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 20),
              const CustomText(
                'Enter Agreement Name',
                fontSize: AppFontSize.titleXSmallFont,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 5),
              CustomTextFormField(
                hint: "Enter Agreement Name",
                borderColor: Theme.of(context).colorScheme.outlineVariant,
                borderRadius: AppStyle.buttonBorderRadius,
                onFieldSubmitted: (value) {},
                maxLines: 2,
                focusNode: FocusNode(),
              ),
              const SizedBox(height: 20),
              const CustomText(
                'Enter Description',
                fontSize: AppFontSize.titleXSmallFont,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 5),
              CustomTextFormField(
                hint: "Write Description here",
                borderColor: Theme.of(context).colorScheme.outlineVariant,
                borderRadius: AppStyle.buttonBorderRadius,
                onFieldSubmitted: (value) {},
                maxLines: 5,
                focusNode: FocusNode(),
              ),
              const SizedBox(height: 30),
              const CustomText(
                'Role',
                fontSize: AppFontSize.titleXSmallFont,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4, // Assume 4 roles
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 30,
                      child: ListTile(
                        leading: Radio<int>(
                          value: index,
                          groupValue: 0,
                          onChanged: (value) {
                            if (value != null) {}
                          },
                        ),
                        title: CustomText(
                          "Role ${index + 1}",
                          // Replace with actual role names
                          fontSize: AppFontSize.labelMediumFont,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const CustomText(
                "Recipient",
                fontSize: AppFontSize.titleXSmallFont,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 20),
              const CustomText(
                'Recipient Name',
                fontSize: AppFontSize.titleXSmallFont,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 5),
              CustomTextFormField(
                hint: "Enter Name",
                borderColor: Theme.of(context).colorScheme.outlineVariant,
                borderRadius: AppStyle.buttonBorderRadius,
                onFieldSubmitted: (value) {},
                focusNode: FocusNode(),
              ),
              const SizedBox(height: 20),
              const CustomText(
                'Recipient Email',
                fontSize: AppFontSize.titleXSmallFont,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 5),
              CustomTextFormField(
                hint: "Enter email",
                borderColor: Theme.of(context).colorScheme.outlineVariant,
                borderRadius: AppStyle.buttonBorderRadius,
                onFieldSubmitted: (value) {},
                focusNode: FocusNode(),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: CustomElevatedTextButton(
                  width: double.maxFinite,
                  text: "Get Started",
                  borderRadius: AppStyle.buttonBorderRadius,
                  onPressed: () {
                    // Handle the submission
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
