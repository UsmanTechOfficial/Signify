import 'package:dyno_sign/domain/consts/consts.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/routes.dart';
import 'package:dyno_sign/presentation/signing_process/bloc/signing_process_cubit.dart';
import 'package:dyno_sign/presentation/signing_process/selected_document_view.02.dart';
import 'package:dyno_sign/presentation/widgets/buttons/custom_outlined_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DocumentPreviewView extends StatelessWidget {
  final SigningProcessCubit cubit;

  const DocumentPreviewView({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    cubit.generatePdfThumbnail();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Document Preview'),
        actions: [
          CustomOutlinedTextButton(
            text: 'Next',
            onPressed: () {
              Go.toNamed(Routes.SELECTED_DOCUMENT, arguments: cubit);
            },
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<SigningProcessCubit, SigningProcessState>(
          bloc: cubit,
          builder: (context, state) {
            if (state is PdfThumbnailLoadingState) {
              return const CircularProgressIndicator();
            } else if (state is PdfThumbnailLoadedState) {
              return Image.memory(state.pdfThumbnail);
            } else if (state is PdfThumbnailErrorState) {
              return Center(child: Text(state.errorMessage));
            } else {
              return const Center(child: Text("No File Found"));
            }
          },
        ),
      ),
    );
  }
}
