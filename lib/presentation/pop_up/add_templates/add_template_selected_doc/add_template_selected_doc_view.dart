import 'package:dyno_sign/presentation/pop_up/add_templates/add_template_selected_doc/bloc/add_template_selected_doc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/consts/consts.dart';
import '../../../../infrastructure/navigation/app_routes/navigation.dart';
import '../../../widgets/dialogs/pdf_preview.dialog.dart';
import '../../../widgets/widgets.dart';
import '../add_template_email_detail/add_template_email_detail_view.dart';

class AddTemplateSelectedDocView extends StatelessWidget {
  const AddTemplateSelectedDocView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = getIt<AddTemplateSelectedDocBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agreement Detail'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appWidth(context) * .05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: CustomOutlinedTextButton(
                  text: 'Next',
                  onPressed: () {
                    Go.to(const AddTemplateEmailDetailView());
                  },
                ),
              ),
              const CustomText(
                "Attached Documents",
                fontSize: AppFontSize.titleXSmallFont,
                fontWeight: FontWeight.w500,
              ),
              BlocBuilder<AddTemplateSelectedDocBloc, AddTemplateSelectedDocState>(
                bloc: bloc,
                builder: (context, state) {
                  if (state is FileSelectedState && state.selectedPdfFileList.isNotEmpty) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.selectedPdfFileList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  leading: const CircleAvatar(
                                    backgroundColor: Colors.redAccent,
                                    child: Icon(Icons.picture_as_pdf, color: Colors.white),
                                  ),
                                  title: CustomText(
                                    state.selectedPdfFileList[index].name,
                                    fontSize: AppFontSize.titleXSmallFont,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  subtitle: CustomText(
                                    state.selectedPdfFileList[index].date.toIso8601String(),
                                    fontSize: AppFontSize.labelSmallFont,
                                    color: Theme.of(context).colorScheme.outline,
                                  ),
                                ),
                              ),
                              PopupMenuButton<int>(
                                icon: const Icon(Icons.more_vert_rounded),
                                onSelected: (value) {
                                  switch (value) {
                                    case 0:
                                      PdfPreviewDialog.show(
                                        context: context,
                                        previewOnly: true,
                                        state.selectedPdfFileList[index].xFile,
                                        check: (result) {},
                                      );
                                      break;
                                    case 1:
                                      bloc.add(RemoveFileEvent(index));
                                      break;
                                  }
                                },
                                itemBuilder: (BuildContext context) => const [
                                  PopupMenuItem(
                                    value: 0,
                                    child: Text('Preview'),
                                  ),
                                  PopupMenuItem(
                                    value: 1,
                                    child: Text('Delete'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const CustomText('No documents added yet.');
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: CustomElevatedTextButton(
                  width: double.infinity,
                  text: "Add another document",
                  onPressed: () {
                    bloc.add(const AddNewFileEvent());
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
