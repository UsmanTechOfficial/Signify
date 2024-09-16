import 'package:dyno_sign/domain/consts/font_size.dart';
import 'package:flutter/material.dart';

import '../../../../domain/consts/global_var.dart';
import '../../../widgets/widgets.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final color = appColorScheme(context);
    final width = appWidth(context);
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: false,
        physics: const NeverScrollableScrollPhysics(),
        key: const PageStorageKey<String>("homeScrollPosition"),
        headerSliverBuilder: (BuildContext context, bool _) {
          return <Widget>[
            const SliverAppBar(
              floating: false,
              snap: false,
              pinned: true,
              title: Text("Settings"),
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                "General Settings",
                fontSize: AppFontSize.titleSmallFont,
                fontWeight: FontWeight.w700,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: GeneralSettings.values.length,
                itemBuilder: (context, index) {
                  final item = GeneralSettings.values[index].settingName;
                  return InkWell(
                    onTap: () {},
                    child: ListTile(
                      dense: true,
                      title: CustomText(
                        item,
                        fontSize: AppFontSize.bodyLargeFont,
                        fontWeight: FontWeight.w400,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15,
                      ),
                    ),
                  );
                },
              ),
              Divider(),
              const CustomText(
                "General Settings",
                fontSize: AppFontSize.titleSmallFont,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum GeneralSettings {
  dateFormat('Date Format'),
  sendingDocuments('Sending Documents'),
  support('Support'),
  feedback('Feedback'),
  termsConditions('Terms and Conditions'),
  privacyPolicy('Privacy Policy'),
  aboutUs('About Us');

  final String settingName;

  const GeneralSettings(this.settingName);
}

enum BiometricSetting { enable, disable }

enum KeyTerms { enable, disable }

enum NotifyDocumentChanges { enable, disable }