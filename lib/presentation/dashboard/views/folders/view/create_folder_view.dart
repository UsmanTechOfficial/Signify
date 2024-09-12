part of '../folders_view.dart';

class CreateFolderView extends StatelessWidget {
  const CreateFolderView({super.key});

  @override
  Widget build(BuildContext context) {
    final color = appColorScheme(context);
    final width = appWidth(context);
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
      body: Padding(
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddTemplate(),
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
                hint: "eg: folder",
                keyboardType: TextInputType.emailAddress,
                borderColor: color.outlineVariant,
                borderRadius: AppStyle.tileBorderRadius,
                onFieldSubmitted: (value) {},
                validator: (p0) {
                  return null;
                }),
          ],
        ),
      ),
    );
  }
}
