import 'package:dyno_sign/presentation/signing_process/bloc/signing_process_cubit.dart';
import 'package:flutter/material.dart';
import 'package:dyno_sign/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/consts/consts.dart';
import '../../infrastructure/navigation/app_routes/navigation.dart';
import '../../infrastructure/navigation/app_routes/routes.dart';

class DocumentSelectedView extends StatelessWidget {
  const DocumentSelectedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agreement Detail'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .05),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: CustomOutlinedTextButton(
                  onPressed: () {
                    Go.toNamed(Routes.AGREEMENT_DETAIL_ADDED);
                  },
                  text: 'Next',
                  borderRadius: AppStyle.outlinedBtnRadius,
                ),
              ),
              const CustomText(
                "Attached Documents",
                fontSize: AppFontSize.titleXSmallFont,
                fontWeight: FontWeight.w500,
              ),
              BlocBuilder<SigningProcessCubit, SigningProcessState>(
                builder: (context, state) {
                  final files = context.watch<SigningProcessCubit>().files;
                  if (state is OnAddAnotherDocumentState && files.isNotEmpty) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: files.length,
                      itemBuilder: (context, index) {
                        final file = files[index];
                        return Card(
                          child: Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  leading: const CircleAvatar(
                                    child: Icon(Icons.picture_as_pdf),
                                  ),
                                  title: CustomText(
                                    file.name,
                                    fontSize: AppFontSize.titleXSmallFont,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  subtitle: CustomText(
                                    file.toString(),
                                    fontSize: AppFontSize.labelSmallFont,
                                    color: Theme.of(context).colorScheme.outline,
                                  ),
                                ),
                              ),
                              PopupMenuButton(
                                icon: const Icon(Icons.more_vert_rounded),
                                onSelected: (value) {
                                  if (value == 0) {
                                    // bloc.deleteFile(index); // Delete the selected file
                                  }
                                },
                                itemBuilder: (BuildContext context) => [
                                  const PopupMenuItem<int>(
                                    value: 0,
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
                  width: double.maxFinite,
                  text: "Add another document",
                  borderRadius: AppStyle.buttonBorderRadius,
                  onPressed: () {
                    context.read<SigningProcessCubit>().selectFile();
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
