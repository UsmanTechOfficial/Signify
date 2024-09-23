import 'package:dyno_sign/domain/consts/font_size.dart';
import 'package:flutter/material.dart';

import '../../../../domain/consts/global_var.dart';
import '../../../widgets/widgets.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = appWidth(context);
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: false,
        // Allow the nested scroll view to scroll
        physics: const BouncingScrollPhysics(),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: const CustomText(
                  "General Settings",
                  fontSize: AppFontSize.titleXSmallFont,
                  fontWeight: FontWeight.w700,
                ),
              ),
              ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                shrinkWrap: true,
                // Allow scrolling for the ListView
                physics: const ClampingScrollPhysics(),
                itemCount: GeneralSettings.values.length,
                itemBuilder: (context, index) {
                  final item = GeneralSettings.values[index].settingName;
                  return InkWell(
                    onTap: () {},
                    child: ListTile(
                      dense: true,
                      title: CustomText(
                        item,
                        fontSize: AppFontSize.bodyMediumFont,
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
              const SizedBox(height: 20),
              const Divider(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05, vertical: 15),
                child: const CustomText(
                  "Security Settings",
                  fontSize: AppFontSize.titleXSmallFont,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: ListTile(
                  dense: true,
                  title: const CustomText(
                    'Enable Biometrics',
                    fontSize: AppFontSize.bodyMediumFont,
                    fontWeight: FontWeight.w400,
                  ),
                  trailing: Switch.adaptive(
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05, vertical: 15),
                child: const CustomText(
                  "Signing Settings",
                  fontSize: AppFontSize.titleXSmallFont,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: ListTile(
                  dense: true,
                  title: const CustomText(
                    'Key Terms',
                    fontSize: AppFontSize.bodyMediumFont,
                    fontWeight: FontWeight.w400,
                  ),
                  trailing: Switch.adaptive(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05, vertical: 15),
                child: const CustomText(
                  "Push Notification Settings",
                  fontSize: AppFontSize.titleXSmallFont,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: ListTile(
                  dense: true,
                  title: const CustomText(
                    'Notify for document changes',
                    fontSize: AppFontSize.bodyMediumFont,
                    fontWeight: FontWeight.w400,
                  ),
                  trailing: Switch.adaptive(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
              ),
              CustomOutlinedTextButton(
                text: 'Signout',
                borderColor: Colors.transparent,
                textSize: AppFontSize.labelMediumFont,
                fontWeight: FontWeight.w500,
                onPressed: () {},
              )
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

enum BiometricSetting {
  enable(true),
  disable(false);

  final bool value;

  const BiometricSetting(this.value);
}

enum KeyTerms {
  enable(true),
  disable(false);

  final bool value;

  const KeyTerms(this.value);
}

enum NotifyDocumentChanges {
  enable(true),
  disable(false);

  final bool value;

  const NotifyDocumentChanges(this.value);
}
