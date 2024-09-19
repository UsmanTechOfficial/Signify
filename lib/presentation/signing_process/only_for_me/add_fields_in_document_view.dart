import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/consts/app_consts/sign_process_types.dart';
import '../../../domain/consts/consts.dart';
import '../../../infrastructure/navigation/app_routes/navigation.dart';
import '../../../infrastructure/navigation/app_routes/routes.dart';
import '../../dashboard/views/home/home_view.dart';
import '../../widgets/widgets.dart';
import '../bloc/signing_process_cubit.dart';

class AddFieldsInDocumentView extends StatelessWidget {
  final SignProcessTypes signProcessTypes;

  const AddFieldsInDocumentView({super.key, required this.signProcessTypes});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<SigningProcessCubit>()..documentPreview();
    final color = appColorScheme(context);
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
                    if (signProcessTypes == SignProcessTypes.requestSignatures) {
                      Go.toNamed(
                        Routes.EMAIL_DETAIL_VIEW,
                        arguments: {
                          'signProcessTypes': SignProcessTypes.requestSignatures,
                        },
                      );
                    } else if (signProcessTypes == SignProcessTypes.onlyForMe) {
                      Go.toNamed(Routes.SIGNATURE_MANAGER);
                    }
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
            BlocBuilder<SigningProcessCubit, SigningProcessState>(
              buildWhen: (_, current) => current is AssignFieldSelectedDoc,
              bloc: cubit,
              builder: (context, state) {
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cubit.selectedPdfFileList.length,
                    itemBuilder: (context, index) {
                      if (state is AssignFieldSelectedDoc) {
                        return SizedBox(
                          width: 150,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: DocCard(
                              isSelected: index == state.index,
                              bottomChild: "2024-09-18",
                              onTap: () {
                                cubit.onDocSelection(index);
                              },
                              child: Image.memory(cubit.selectedPdfFileList[index].bytes),
                            ),
                          ),
                        );
                      }
                      return SizedBox(
                        width: 150,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: DocCard(
                            isSelected: index == 0,
                            bottomChild: "2024-09-18",
                            onTap: () {
                              cubit.onDocSelection(index);
                            },
                            child: Image.memory(cubit.selectedPdfFileList[index].bytes),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
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
            // Use the cubit directly with BlocBuilder
            BlocBuilder<SigningProcessCubit, SigningProcessState>(
              bloc: cubit,
              builder: (context, state) {
                if (state is DocumentPreviewLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is DocumentPreviewLoaded) {
                  return Image.memory(cubit.selectedPdfFileList.first.bytes);
                } else if (state is DocumentPreviewError) {
                  return CustomText(state.msg);
                } else if (state is AssignFieldSelectedDoc) {
                  return Image.memory(cubit.selectedPdfFileList[state.index].bytes);
                }
                return const CustomText("No Preview Found");
              },
            ),
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
              blurRadius: 10,
            ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//   @override
//   Widget build(BuildContext context) {
//     final cubit = getIt<SigningProcessCubit>()..documentPreview();
//     final color = appColorScheme(context);
//     final width = appWidth(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Agreement Detail'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: EdgeInsets.only(right: width * 0.05),
//               child: Align(
//                 alignment: Alignment.centerRight,
//                 child: CustomOutlinedTextButton(
//                   onPressed: () {
//                     if (signProcessTypes == SignProcessTypes.requestSignatures) {
//                       Go.toNamed(
//                         Routes.EMAIL_DETAIL_VIEW,
//                         arguments: {
//                           'signProcessTypes': SignProcessTypes.requestSignatures,
//                         },
//                       );
//                     } else if (signProcessTypes == SignProcessTypes.onlyForMe) {
//                       Go.toNamed(Routes.SIGNATURE_MANAGER);
//                     }
//                   },
//                   text: 'Next',
//                   borderRadius: AppStyle.outlinedBtnRadius,
//                 ),
//               ),
//             ),
//
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: width * .05),
//                 child: const CustomText(
//                   "Signee",
//                   fontSize: AppFontSize.titleMSmallFont,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//
//             ListTile(
//                 leading: SizedBox(
//                   height: 25,
//                   width: 25,
//                   child: Card(
//                     elevation: 0,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
//                     color: color.primary,
//                   ),
//                 ),
//                 title: const CustomText(
//                   'Amir',
//                   fontSize: AppFontSize.titleXSmallFont,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 subtitle: CustomText(
//                   'Need to sign',
//                   fontSize: AppFontSize.labelSmallFont,
//                   color: color.outline,
//                 ),
//                 trailing: CircleAvatar(
//                   radius: 15,
//                   backgroundColor: color.primary,
//                   child: const Center(
//                     child: CustomText('A'),
//                   ),
//                 )),
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: width * .05),
//                     child: const CustomText(
//                       "Attached Documents",
//                       fontSize: AppFontSize.titleMSmallFont,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             BlocBuilder<SigningProcessCubit, SigningProcessState>(
//               bloc: cubit,
//               builder: (context, state) {
//                 return SizedBox(
//                   height: 200,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: cubit.pickedFiles.length,
//                     itemBuilder: (context, index) {
//                       if (state is DocumentPreviewLoaded) {
//                         return SizedBox(
//                           width: 150,
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 8),
//                             child: DocCard(
//                               isSelected: index.isOdd,
//                               bottomChild: "2024-09-18",
//                               onTap: () {},
//                               child: Image.memory(state.imageBytes),
//                             ),
//                           ),
//                         );
//                       }
//                       return SizedBox(
//                         width: 150,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 8),
//                           child: DocCard(
//                             // isSelected: index.isOdd,
//                             child: const Center(child: Icon(Icons.error)),
//                             onTap: () {},
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               },
//             ),
//             const SizedBox(height: 50),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: width * .05),
//                 child: CustomText(
//                   cubit.pickedFiles.first.name,
//                   fontSize: AppFontSize.titleMSmallFont,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//             // Use the cubit directly with BlocBuilder
//             BlocBuilder<SigningProcessCubit, SigningProcessState>(
//               bloc: cubit,
//               builder: (context, state) {
//                 if (state is DocumentPreviewLoading) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (state is DocumentPreviewLoaded) {
//                   return Padding(
//                     padding: const EdgeInsets.all(15),
//                     child: DecoratedBox(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(AppStyle.tileBorderRadius),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: color.shadow,
//                                 offset: const Offset(0, 0),
//                                 spreadRadius: 1,
//                                 blurRadius: 4)
//                           ]),
//                       child: ClipRRect(
//                         clipBehavior: Clip.hardEdge,
//                         borderRadius: BorderRadius.circular(AppStyle.tileBorderRadius),
//                         child: Image.memory(
//                           state.imageBytes,
//                         ),
//                       ),
//                     ),
//                   );
//                 } else if (state is DocumentPreviewError) {
//                   return CustomText(state.msg);
//                 }
//                 return const CustomText("No Preview Found");
//               },
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         margin: const EdgeInsets.only(bottom: 10),
//         height: 110,
//         width: double.maxFinite,
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: color.outlineVariant.withOpacity(0.5),
//               offset: const Offset(0, -4),
//               blurRadius: 10,
//             ),
//           ],
//           color: color.surface,
//           borderRadius: const BorderRadius.only(
//             topRight: Radius.circular(AppStyle.sheetRadius),
//             topLeft: Radius.circular(AppStyle.sheetRadius),
//           ),
//         ),
//         child: const Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: CustomText(
//                   "Add Field",
//                   fontSize: AppFontSize.titleSmallFont,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               Expanded(
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     BottomField(
//                       label: 'Signature',
//                       icon: Icons.edit,
//                     ),
//                     BottomField(
//                       label: 'Initials',
//                       icon: Icons.wordpress,
//                       color: Colors.pinkAccent,
//                     ),
//                     BottomField(
//                       label: 'Date',
//                       icon: Icons.calendar_month,
//                       color: Colors.orange,
//                     ),
//                     BottomField(
//                       label: 'Text Field',
//                       icon: Icons.text_fields,
//                       color: Colors.green,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class BottomField extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final String label;

  const BottomField({super.key, required this.icon, this.color, required this.label});

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
                  borderRadius: BorderRadius.circular(AppStyle.outlinedBtnRadius)),
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
