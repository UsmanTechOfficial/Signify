import 'dart:io';

import 'package:dyno_sign/domain/consts/consts.dart';
import 'package:dyno_sign/presentation/dashboard/views/profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../assets_gen/assets.gen.dart';
import '../../../widgets/widgets.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final color = appColorScheme(context);
    final width = appWidth(context);
    return NestedScrollView(
      floatHeaderSlivers: false,
      physics: const NeverScrollableScrollPhysics(),
      key: const PageStorageKey<String>("homeScrollPosition"),
      headerSliverBuilder: (BuildContext context, bool _) {
        return <Widget>[
          const SliverAppBar(
            floating: false,
            snap: false,
            pinned: true,
            title: Text("Edit Profile"),
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
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 100,
                width: 100,
                child: InkWell(
                  splashColor: color.secondaryContainer,
                  radius: 45,
                  onTap: () {
                    context.read<ProfileBloc>().add(UpdateProfileImage());
                  },
                  child: BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      if (state is ProfileInitial) {
                        return CircleAvatar(
                          radius: 40,
                          backgroundColor: color.outlineVariant,
                          child: Icon(
                            Icons.person,
                            size: 50,
                            color: color.outline,
                          ),
                        );
                      } else if (state is ProfileImageSelectedSuccess) {
                        return CircleAvatar(
                          radius: 40,
                          backgroundImage: FileImage(File(state.imagePath)),
                        );
                      }
                      return CircleAvatar(
                        radius: 40,
                        backgroundColor: color.outlineVariant,
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: color.outline,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: CustomText(
                  'Tap to upload new image',
                  color: color.tertiary,
                  fontWeight: FontWeight.w500,
                  fontSize: AppFontSize.labelMediumFont,
                ),
              ),
            ),
            CustomText("Enter Name",
                fontSize: AppFontSize.titleXSmallFont,
                fontWeight: FontWeight.w500,
                color: color.outline),
            const SizedBox(height: 5),
            CustomTextFormField(
              hint: "Enter Name",
              keyboardType: TextInputType.name,
              borderColor: color.outlineVariant,
              borderRadius: AppStyle.buttonBorderRadius,
              onFieldSubmitted: (value) {},
              validator: (p0) {
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomText("Enter Email",
                fontSize: AppFontSize.titleXSmallFont,
                fontWeight: FontWeight.w500,
                color: color.outline),
            const SizedBox(height: 5),
            CustomTextFormField(
              hint: "Enter Email",
              keyboardType: TextInputType.emailAddress,
              borderColor: color.outlineVariant,
              borderRadius: AppStyle.buttonBorderRadius,
              onFieldSubmitted: (value) {},
              validator: (p0) {
                return null;
              },
            ),
            const SizedBox(height: 20),
            const CustomText(
              "Update Password",
              fontSize: AppFontSize.titleSmallFont,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 20),
            CustomText("Previous Password",
                fontSize: AppFontSize.titleXSmallFont,
                fontWeight: FontWeight.w500,
                color: color.outline),
            const SizedBox(height: 5),
            CustomTextFormField(
              hint: 'Enter Previous  password',
              borderColor: color.outlineVariant,
              keyboardType: TextInputType.visiblePassword,
              borderRadius: AppStyle.buttonBorderRadius,
              validator: (p0) {
                return null;
              },
              suffix: IconButton(
                  icon: Icon(
                    color: color.outlineVariant,
                    Icons.visibility_off,
                  ),
                  onPressed: () {}),
            ),
            const SizedBox(height: 20),
            CustomText(
              "New Password",
              fontSize: AppFontSize.titleXSmallFont,
              fontWeight: FontWeight.w500,
              color: color.outline,
            ),
            const SizedBox(height: 5),
            CustomTextFormField(
              hint: 'Enter New  password',
              borderColor: color.outlineVariant,
              borderRadius: AppStyle.buttonBorderRadius,
              keyboardType: TextInputType.visiblePassword,
              validator: (p0) {
                return null;
              },
              suffix: IconButton(
                  icon: Icon(
                    color: color.outlineVariant,
                    Icons.visibility_off,
                  ),
                  onPressed: () {}),
            ),
            const SizedBox(height: 20),
            CustomElevatedTextButton(
              width: double.maxFinite,
              text: 'Save Changes',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
