import 'package:flutter/material.dart';

import '../../../../domain/consts/consts.dart';
import '../../../widgets/widgets.dart';

class ReqSignAgreementOverviewView extends StatelessWidget {
  const ReqSignAgreementOverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final color = appColorScheme(context);
    // final height = appHeight(context);
    final width = appWidth(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agreement Detail'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    "Name",
                    fontSize: AppFontSize.titleSmallFont,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 5),
                  CustomText(
                    "Agreement 1",
                    fontSize: AppFontSize.labelMediumFont,
                    color: color.outline,
                  ),
                  const SizedBox(height: 20),
                  const CustomText(
                    "Description",
                    fontSize: AppFontSize.titleSmallFont,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 5),
                  CustomText(
                    "Your data's security is our top priority. Controlly offers robust security measures to protect your information.",
                    fontSize: AppFontSize.labelMediumFont,
                    color: color.outline,
                    space: 1,
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    height: 140,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: color.primary,
                        borderRadius: BorderRadius.circular(AppStyle.tileBorderRadius)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          "Agreement Detail",
                          fontSize: AppFontSize.titleSmallFont,
                          color: color.surface,
                          fontWeight: FontWeight.w600,
                        ),
                        Divider(
                          color: color.surface,
                          thickness: 1,
                        ),
                        const CardTile(title: "Amir Mahmod", label: "Sender"),
                        const CardTile(title: "12/04/2024", label: "Created on"),
                        const CardTile(title: "amir@email.com", label: "Email"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(
                        "Attached Documents",
                        fontSize: AppFontSize.titleSmallFont,
                        fontWeight: FontWeight.w500,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: CustomText(
                          "See all",
                          fontSize: AppFontSize.labelSmallFont,
                          fontWeight: FontWeight.w500,
                          color: color.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // SliverGrid.builder(
            //   itemCount: cubit.selectedPdfFileList.length,
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            //   itemBuilder: (context, index) {
            //     return DocCard(
            //       bottomChild: '',
            //       isSelected: index.isEven,
            //       child: BlocBuilder<SigningProcessCubit, SigningProcessState>(
            //         bloc: cubit,
            //         builder: (context, state) {
            //           if (state is DocumentPreviewLoading) {
            //             return const Center(child: CircularProgressIndicator());
            //           } else if (state is DocumentPreviewLoaded) {
            //             return Image.memory(state.imageBytes);
            //           } else if (state is DocumentPreviewError) {
            //             return CustomText(state.msg);
            //           }
            //           return const CustomText("No Preview Found");
            //         },
            //       ),
            //       onTap: () {},
            //     );
            //   },
            // ),
            const SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  CustomText(
                    "Recipient List",
                    fontSize: AppFontSize.titleSmallFont,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            SliverList.builder(
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
          ],
        ),
      ),
    );
  }
}

class CardTile extends StatelessWidget {
  final String label;
  final String title;

  const CardTile({super.key, required this.title, required this.label});

  @override
  Widget build(BuildContext context) {
    final color = appColorScheme(context);
    return SizedBox(
      height: 30,
      child: ListTile(
        dense: true,
        leading: CustomText(
          label,
          fontSize: AppFontSize.labelSmallFont,
          color: color.surface,
        ),
        title: CustomText(
          title,
          fontSize: AppFontSize.titleMSmallFont,
          color: color.surface,
        ),
      ),
    );
  }
}
