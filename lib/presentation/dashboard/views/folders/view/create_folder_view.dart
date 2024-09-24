part of '../folders_view.dart';

class CreateFolderView extends StatelessWidget {
  const CreateFolderView({super.key});

  @override
  Widget build(BuildContext context) {
    final color = appColorScheme(context);
    final width = appWidth(context);
    TextEditingController controller = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText('Create Folder'),
        actions: [
          CustomIconButton(
            backgroundColor: color.outlineVariant.withOpacity(0.5),
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomOutlinedTextButton(
                    text: 'Next',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        var folder = FolderModel(name: controller.text, desc: 'amir');
                        getIt<FoldersBloc>().foldersList.add(folder);
                      }

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FolderTemplatesList(),
                          ));
                    },
                  )
                ],
              ),
              const CustomText(
                "Enter Folder Name",
                fontSize: AppFontSize.titleXSmallFont,
                fontWeight: FontWeight.w500,
              ),
              CustomTextFormField(
                  controller: controller,
                  hint: "eg: folder",
                  keyboardType: TextInputType.text,
                  borderColor: color.outlineVariant,
                  borderRadius: AppStyle.tileBorderRadius,
                  onFieldSubmitted: (value) {},
                  validator: (p0) {
                    return Validation.validate(controller, 'Folder Name');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
