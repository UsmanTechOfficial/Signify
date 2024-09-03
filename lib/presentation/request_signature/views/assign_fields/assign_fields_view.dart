import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/routes.dart';
import 'package:flutter/material.dart';
import '../../../../domain/consts/font_size.dart';
import '../../../../domain/consts/global_var.dart';
import '../../../../domain/consts/styles.dart';

import '../../../widgets/buttons/custom_outlined_text_button.dart';
import '../../../widgets/text/custom_text.dart';
import '../../../dashboard/views/home/home_view.dart';

class AssignFieldsView extends StatelessWidget {
  const AssignFieldsView({super.key});

  @override
  Widget build(BuildContext context) {
    final color = appColorScheme(context);
    final height = appHeight(context);
    final width = appWidth(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agreement Detail'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: width * 0.05),
              child: Align(
                alignment: Alignment.centerRight,
                child: CustomOutlinedTextButton(
                  onPressed: () {
                    Go.toNamed(Routes.EMAIL_DETAIL_VIEW);
                  },
                  text: 'Next',
                  borderRadius: AppStyle.outlinedBtnRadius,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .05),
                child: const CustomText(
                  "Attached Documents",
                  fontSize: AppFontSize.titleXSmallFont,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10, // Number of items
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: DocCard(
                        isSelected: index.isOdd,
                        child: Container(
                          color: color.primaryContainer,
                        ),
                        onTap: () {},
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .05),
                child: const CustomText(
                  "Selected Documents",
                  fontSize: AppFontSize.titleXSmallFont,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: height * .7,
              width: width * .95,
              child: Card(
                elevation: 6,
                color: color.outlineVariant,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppStyle.buttonBorderRadius,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 110,
        width: double.maxFinite,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: color.outlineVariant.withOpacity(0.5),
                offset: const Offset(0, -4),
                blurRadius: 10)
          ],
          color: color.surface,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(AppStyle.sheetRadius),
            topLeft: Radius.circular(AppStyle.sheetRadius),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomText(
                  "Add Field",
                  fontSize: AppFontSize.titleSmallFont,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomField(
                      label: 'Signature',
                      icon: Icons.edit,
                    ),
                    BottomField(
                      label: 'Initials',
                      icon: Icons.wordpress,
                      color: Colors.pinkAccent,
                    ),
                    BottomField(
                      label: 'Date',
                      icon: Icons.calendar_month,
                      color: Colors.orange,
                    ),
                    BottomField(
                      label: 'Text Field',
                      icon: Icons.text_fields,
                      color: Colors.green,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BottomField extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final String label;

  const BottomField(
      {super.key, required this.icon, this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    final colorScheme = appColorScheme(context);
    return Column(
      children: [
        SizedBox(
          height: 40,
          width: 40,
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(AppStyle.outlinedBtnRadius)),
              elevation: 4,
              shadowColor: colorScheme.outlineVariant,
              child: Icon(icon, color: color ?? colorScheme.primary, size: 25)),
        ),
        CustomText(
          label,
          fontSize: AppFontSize.labelSmallFont,
          fontWeight: FontWeight.w500,
        )
      ],
    );
  }
}
