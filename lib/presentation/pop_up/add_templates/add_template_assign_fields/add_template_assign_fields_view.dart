import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
import 'package:dyno_sign/presentation/pop_up/add_templates/add_template_assign_fields/bloc/add_template_assign_fields_bloc.dart';
import 'package:dyno_sign/presentation/pop_up/add_templates/add_template_selected_doc/bloc/add_template_selected_doc_bloc.dart';
import 'package:dyno_sign/presentation/pop_up/add_templates/add_templates_overview/add_templates_overview_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/consts/consts.dart';
import '../../../dashboard/views/home/home_view.dart';
import '../../../widgets/widgets.dart';

class AddTemplateAssignFieldsView extends StatelessWidget {
  const AddTemplateAssignFieldsView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = getIt<AddTemplateAssignFieldsBloc>()..add(const DocumentPreviewRequested());
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
                    Go.to(const AddTemplatesOverviewView());
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
            BlocBuilder<AddTemplateAssignFieldsBloc, AddTemplateAssignFieldsState>(
              buildWhen: (_, current) => current is AssignFieldSelectedDoc,
              bloc: bloc,
              builder: (context, state) {
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: addTemplateSelectedPdfFileList.length,
                    itemBuilder: (context, index) {
                      if (state is DocumentPreviewLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is AssignFieldSelectedDoc) {
                        return SizedBox(
                          width: 150,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: DocCard(
                              isSelected: index == state.index,
                              bottomChild: "2024-09-18",
                              onTap: () {
                                bloc.add(DocumentSelected(index));
                              },
                              child: Image.memory(addTemplateSelectedPdfFileList[index].bytes),
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
                              bloc.add(DocumentSelected(index));
                            },
                            child: Image.memory(addTemplateSelectedPdfFileList[index].bytes),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            BlocBuilder<AddTemplateAssignFieldsBloc, AddTemplateAssignFieldsState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is DocumentPreviewLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is DocumentPreviewLoaded) {
                  return Image.memory(state.imageBytes);
                } else if (state is DocumentPreviewError) {
                  return CustomText(state.msg);
                } else if (state is AssignFieldSelectedDoc) {
                  return Image.memory(addTemplateSelectedPdfFileList[state.index].bytes);
                }
                return const CustomText("No Preview Found");
              },
            ),
            const SizedBox(height: 50),
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
