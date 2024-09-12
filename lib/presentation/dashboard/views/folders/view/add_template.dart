part of '../folders_view.dart';

class AddTemplate extends StatelessWidget {
  const AddTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final searchController = TextEditingController();
    final width = appWidth(context);

    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            CustomAppbar(
              leading: CustomIconButton(
                  onPressed: () => Navigator.pop(context), icon: Icon(Icons.adaptive.arrow_back)),
              title: "Add Templates",
              action: CustomIconButton(
                padding: 10,
                icon: Icon(Icons.add, color: color.surface),
                backgroundColor: color.primary,
                onPressed: () {},
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          height: 40,
                          controller: searchController,
                          hint: "Search here",
                          borderColor: Colors.transparent,
                          filled: true,
                          readOnly: true,
                          prefix: Icons.search_rounded,
                          fillColor: color.outlineVariant.withOpacity(0.5),
                          borderRadius: AppStyle.buttonBorderRadius,
                          focusBorderColor: Colors.transparent,
                          onTap: () {
                            showSearch(
                              context: context,
                              delegate: TemplatesSearchDelegate(),
                            );
                          },
                        ),
                      ),
                      CustomIconButton(
                        padding: 10,
                        icon: const Icon(Icons.bar_chart),
                        onPressed: () {
                          showModalBottomSheet(
                            showDragHandle: true,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return const TemplateFilterSheet();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .05, vertical: width * .05),
            child: Column(
              children: [
                CustomElevatedTextButton(
                  width: double.maxFinite,
                  text: "Add Template",
                  onPressed: () {},
                )
              ],
            ),
          ),
        ));
  }
}

class TemplateFilterSheet extends StatelessWidget {
  const TemplateFilterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final color = appColorScheme(context);
    return DraggableScrollableSheet(
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          padding: EdgeInsets.symmetric(horizontal: appWidth(context) * .04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomOutlinedTextButton(
                    text: "Reset",
                    borderColor: Colors.transparent,
                    textColor: color.outline,
                    onPressed: () {},
                  ),
                  CustomOutlinedTextButton(
                    text: "Apply",
                    borderColor: color.outlineVariant,
                    textColor: color.onSurface,
                    onPressed: () {},
                  ),
                ],
              ),
              const CustomText(
                "Status",
                fontWeight: FontWeight.w600,
                fontSize: AppFontSize.titleSmallFont,
              ),
              ListView.builder(
                shrinkWrap: true,
                controller: scrollController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: StatusFilters.values.length,
                itemBuilder: (context, index) {
                  final filter = StatusFilters.values[index];

                  return SizedBox(
                    height: 40,
                    child: ListTile(
                      dense: true,
                      leading: Radio<StatusFilters>.adaptive(
                        activeColor: appColorScheme(context).primary,
                        value: filter,
                        groupValue: StatusFilters.all,
                        onChanged: (newValue) {},
                      ),
                      title: CustomText(
                        filter.label,
                        fontSize: AppFontSize.labelMediumFont,
                      ),
                    ),
                  );
                },
              ),
              const CustomText(
                "Date",
                fontWeight: FontWeight.w600,
                fontSize: AppFontSize.titleSmallFont,
              ),
              ListView.builder(
                shrinkWrap: true,
                controller: scrollController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: DateFilters.values.length,
                itemBuilder: (context, index) {
                  final filter = DateFilters.values[index];
                  return SizedBox(
                    height: 40,
                    child: ListTile(
                      dense: true,
                      leading: Radio<DateFilters>.adaptive(
                        activeColor: appColorScheme(context).primary,
                        value: filter,
                        groupValue: DateFilters.all,
                        onChanged: (newValue) {},
                      ),
                      title: CustomText(
                        filter.label,
                        fontSize: AppFontSize.labelMediumFont,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class TemplatesSearchDelegate extends SearchDelegate<String> {
  TemplatesSearchDelegate();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Center(child: Text('No results found.'));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }
}
