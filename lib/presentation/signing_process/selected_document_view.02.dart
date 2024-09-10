import 'package:dyno_sign/presentation/signing_process/bloc/signing_process_cubit.dart';
import 'package:dyno_sign/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/consts/consts.dart';
import '../../infrastructure/navigation/app_routes/navigation.dart';
import '../../infrastructure/navigation/app_routes/routes.dart';

class DocumentSelectedView extends StatelessWidget {
  final SigningProcessCubit cubit;

  const DocumentSelectedView({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
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
                    Go.toNamed(Routes.AGREEMENT_DETAIL_ADDED);
                  },
                ),
              ),
              const CustomText(
                "Attached Documents",
                fontSize: AppFontSize.titleXSmallFont,
                fontWeight: FontWeight.w500,
              ),
              BlocBuilder<SigningProcessCubit, SigningProcessState>(
                bloc: cubit,
                builder: (context, state) {
                  final files = state is FileSelectedState ? state.files : cubit.pickedFiles;
                  return files.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: files.length,
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
                                        files[index].name,
                                        fontSize: AppFontSize.titleXSmallFont,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      subtitle: CustomText(
                                        files[index].date.toIso8601String(),
                                        fontSize: AppFontSize.labelSmallFont,
                                        color: Theme.of(context).colorScheme.outline,
                                      ),
                                    ),
                                  ),
                                  PopupMenuButton<int>(
                                    icon: const Icon(Icons.more_vert_rounded),
                                    onSelected: (value) {
                                      if (value == 0) {
                                        cubit.removeFile(index);
                                      }
                                    },
                                    itemBuilder: (BuildContext context) => const [
                                      PopupMenuItem(
                                        value: 0,
                                        child: Text('Delete'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : const CustomText('No documents added yet.');
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: CustomElevatedTextButton(
                  width: double.infinity,
                  text: "Add another document",
                  onPressed: () {
                    cubit.pickFiles(allowMultiple: true);
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