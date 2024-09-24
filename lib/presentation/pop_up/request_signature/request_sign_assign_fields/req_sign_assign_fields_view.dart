import 'package:dyno_sign/presentation/pop_up/request_signature/request_sign_selected_document/bloc/req_sign_selected_doc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../domain/consts/consts.dart';
import '../../../widgets/widgets.dart';
import 'bloc/req_sign_assign_fields_bloc.dart';

class ReqSignAssignFieldsView extends StatefulWidget {
  const ReqSignAssignFieldsView({super.key});

  @override
  State<ReqSignAssignFieldsView> createState() =>
      _ReqSignAssignFieldsViewState();
}

class _ReqSignAssignFieldsViewState extends State<ReqSignAssignFieldsView> {
  @override
  Widget build(BuildContext context) {
    final bloc = getIt<ReqSignAssignFieldsBloc>()
      ..add(const DocumentPreviewRequested());
    final color = appColorScheme(context);
    final width = appWidth(context);

    PlaceHolderFields? dropItems;
    Offset offset = Offset.zero;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Agreement Detail'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Padding(
            //   padding: EdgeInsets.only(right: width * 0.05),
            //   child: Align(
            //     alignment: Alignment.centerRight,
            //     child: CustomOutlinedTextButton(
            //       onPressed: () {
            //         Go.to(const ReqSignEmailDetailView());
            //       },
            //       text: 'Next',
            //       borderRadius: AppStyle.outlinedBtnRadius,
            //     ),
            //   ),
            // ),
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: width * .05),
            //     child: const CustomText(
            //       "Attached Documents",
            //       fontSize: AppFontSize.titleXSmallFont,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            // ),
            // BlocBuilder<ReqSignAssignFieldsBloc, ReqSignAssignFieldsState>(
            //   buildWhen: (_, current) => current is AssignFieldSelectedDoc,
            //   bloc: bloc,
            //   builder: (context, state) {
            //     return SizedBox(
            //       height: 200,
            //       child: ListView.builder(
            //         scrollDirection: Axis.horizontal,
            //         itemCount: selectedPdfFileList.length,
            //         itemBuilder: (context, index) {
            //           if (state is DocumentPreviewLoading) {
            //             return const Center(child: CircularProgressIndicator());
            //           } else if (state is AssignFieldSelectedDoc) {
            //             return SizedBox(
            //               width: 150,
            //               child: Padding(
            //                 padding: const EdgeInsets.symmetric(vertical: 8),
            //                 child: DocCard(
            //                   isSelected: index == state.index,
            //                   bottomChild: "2024-09-18",
            //                   onTap: () {
            //                     bloc.add(DocumentSelected(index));
            //                   },
            //                   child: Image.memory(selectedPdfFileList[index].bytes),
            //                 ),
            //               ),
            //             );
            //           }
            //           return SizedBox(
            //             width: 150,
            //             child: Padding(
            //               padding: const EdgeInsets.symmetric(vertical: 8),
            //               child: DocCard(
            //                 isSelected: index == 0,
            //                 bottomChild: "2024-09-18",
            //                 onTap: () {
            //                   bloc.add(DocumentSelected(index));
            //                 },
            //                 child: Image.memory(selectedPdfFileList[index].bytes),
            //               ),
            //             ),
            //           );
            //         },
            //       ),
            //     );
            //   },
            // ),
            DragTarget<PlaceHolderFields>(
              onAcceptWithDetails: (details) {
                offset = details.offset;
                dropItems = details.data;
              },
              builder: (context, candidateData, rejectedData) {
                return Stack(
                  children: [
                    BlocBuilder<ReqSignAssignFieldsBloc,
                        ReqSignAssignFieldsState>(
                      bloc: bloc,
                      builder: (context, state) {
                        if (state is DocumentPreviewLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is DocumentPreviewLoaded) {
                          return Image.memory(state.imageBytes);
                        } else if (state is DocumentPreviewError) {
                          return CustomText(state.msg);
                        } else if (state is AssignFieldSelectedDoc) {
                          return Image.memory(
                              selectedPdfFileList[state.index].bytes);
                        }
                        return const CustomText("No Preview Found");
                      },
                    ),
                    if (dropItems != null)
                      Positioned.fromRect(
                        rect: Rect.fromLTWH(offset.dx,
                            offset.dy - appHeight(context) * 0.15, 100, 50),
                        child: SizedBox(
                          width: appWidth(context) * 0.25,
                          height: 45,
                          child: Card.outlined(
                            elevation: 0,
                            color: dropItems!.color.withOpacity(0.2),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: dropItems!.color),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                dropItems!.iconPath,
                                colorFilter: ColorFilter.mode(
                                  color.onSurface,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 130,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: PlaceHolderFields.values.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                mainAxisExtent: 50,
              ),
              itemBuilder: (context, index) {
                final placeHolder = PlaceHolderFields.values[index];
                return Draggable<PlaceHolderFields>(
                  data: placeHolder,
                  childWhenDragging: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppStyle.buttonBorderRadius),
                    ),
                    color: color.outlineVariant.withOpacity(0.2),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 40,
                          width: width * .15,
                          child: Card(
                            elevation: 0,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            color: color.outlineVariant,
                            child: Center(
                              child: SvgPicture.asset(placeHolder.iconPath),
                            ),
                          ),
                        ),
                        CustomText(
                          placeHolder.name,
                          fontSize: AppFontSize.labelMediumFont,
                          fontWeight: FontWeight.w500,
                          color: color.onSurface,
                        )
                      ],
                    ),
                  ),
                  feedback: SizedBox(
                    width: appWidth(context) * 0.25,
                    height: 45,
                    child: Card.outlined(
                      elevation: 0,
                      color: placeHolder.color.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: placeHolder.color),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          placeHolder.iconPath,
                          colorFilter: ColorFilter.mode(
                            color.onSurface,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppStyle.buttonBorderRadius),
                    ),
                    color: placeHolder.color.withOpacity(0.2),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 40,
                          width: width * .15,
                          child: Card(
                            elevation: 0,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            color: placeHolder.color,
                            child: Center(
                              child: SvgPicture.asset(placeHolder.iconPath),
                            ),
                          ),
                        ),
                        CustomText(
                          placeHolder.name,
                          fontSize: AppFontSize.labelMediumFont,
                          fontWeight: FontWeight.w500,
                          color: color.onSurface,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}

enum PlaceHolderFields {
  signature('Signature', 'assets/icons/ic_signature.svg', Color(0xff1DA1FA)),
  initials('Initials', 'assets/icons/ic_initials.svg', Color(0xffFA1DA2)),
  date('Date', 'assets/icons/ic_date.svg', Color(0xffFF8A00)),
  textField('Text Field', 'assets/icons/ic_text_field.svg', Color(0xff51D401));

  final String name;
  final String iconPath;
  final Color color;

  const PlaceHolderFields(this.name, this.iconPath, this.color);
}
