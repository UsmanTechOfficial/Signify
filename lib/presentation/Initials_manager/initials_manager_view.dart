import 'package:flutter/material.dart';

import '../../domain/consts/consts.dart';
import '../widgets/widgets.dart';

class InitialsManagerView extends StatelessWidget {
  const InitialsManagerView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = appWidth(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _appBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .05),
          child: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              ChooseTab(),
              TypeTab(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('Add Initials'),
      centerTitle: true,
      bottom: const TabBar(
        tabs: <Widget>[
          Tab(text: "Choose"),
          Tab(text: "Type"),
        ],
      ),
    );
  }
}

class ChooseTab extends StatelessWidget {
  const ChooseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Checkbox.adaptive(
                value: true,
                onChanged: (value) {},
              ),
              const CustomText('Set as Default')
            ],
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio.adaptive(
                        value: index == 0,
                        groupValue: true,
                        onChanged: (value) {},
                      ),
                      const Expanded(
                        child: SizedBox(
                          height: 50,
                          child: Card(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: CustomText("A M"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class TypeTab extends StatelessWidget {
  const TypeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final color = appColorScheme(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * .05),
        const CustomText(
          "Enter Full Name*",
          fontSize: AppFontSize.titleXSmallFont,
          fontWeight: FontWeight.w500,
        ),
        CustomTextFormField(
          hint: "Enter Email",
          keyboardType: TextInputType.emailAddress,
          borderColor: color.outlineVariant,
          borderRadius: AppStyle.buttonBorderRadius,
          onFieldSubmitted: (value) => {},
          validator: (p0) => null,
        ),
        const SizedBox(height: 20),
        const CustomText(
          "Initials",
          fontSize: AppFontSize.titleXSmallFont,
          fontWeight: FontWeight.w500,
        ),
        CustomTextFormField(
          hint: 'Enter Initials',
          borderColor: color.outlineVariant,
          borderRadius: AppStyle.buttonBorderRadius,
          validator: (p0) => null,
        ),
        const SizedBox(height: 20),
        CustomElevatedTextButton(
          width: double.maxFinite,
          onPressed: () {},
          text: "Save",
        ),
      ],
    );
  }
}
