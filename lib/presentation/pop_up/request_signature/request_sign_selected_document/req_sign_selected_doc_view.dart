import 'package:dyno_sign/domain/utils/utils.dart';
import 'package:dyno_sign/infrastructure/dal/models/selected_file.model.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/consts/consts.dart';
import '../../../widgets/dialogs/pdf_preview.dialog.dart';
import '../../../widgets/widgets.dart';
import 'bloc/req_sign_selected_doc_bloc.dart';

class ReqSignSelectedDocView extends StatelessWidget {
  final SelectedFileModel file;

  const ReqSignSelectedDocView({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ReqSignSelectedDocBloc>();

    // add file receive from previous screen
    bloc.add(InitialEvent([file]));
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
                    bloc.add(const NextNavigateEvent());
                  },
                ),
              ),
              const CustomText(
                "Attached Documents",
                fontSize: AppFontSize.titleXSmallFont,
                fontWeight: FontWeight.w500,
              ),
              BlocConsumer<ReqSignSelectedDocBloc, ReqSignSelectedDocState>(
                bloc: bloc,
                listenWhen: (previous, current) => previous != current,
                listener: (context, state) {
                  if (state is FileSelectedState && state.selectedPdfFiles.isEmpty) {
                    CSnackBar.show('Cannot remove the last document.');
                  }
                },
                buildWhen: (_, current) => current is FileSelectedState,
                builder: (context, state) {
                  if (state is FileSelectedState && state.selectedPdfFiles.isNotEmpty) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.selectedPdfFiles.length,
                      itemBuilder: (context, index) {
                        return _buildFileCard(context, bloc, state, index);
                      },
                    );
                  } else {
                    return const CustomText(
                      'No documents added yet.',
                      textAlign: TextAlign.center,
                    );
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

  Widget _buildFileCard(
      BuildContext context, ReqSignSelectedDocBloc bloc, FileSelectedState state, int index) {
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
                state.selectedPdfFiles[index].name,
                fontSize: AppFontSize.titleXSmallFont,
                fontWeight: FontWeight.w500,
              ),
              subtitle: CustomText(
                state.selectedPdfFiles[index].date.toIso8601String(),
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
                    XFile.fromData(state.selectedPdfFiles[index].bytes,
                        name: state.selectedPdfFiles[index].name, mimeType: 'application/pdf'),
                    check: (_) {},
                    previewOnly: true,
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
  }
}
