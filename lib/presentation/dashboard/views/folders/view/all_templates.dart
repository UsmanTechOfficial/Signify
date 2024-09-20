import 'package:flutter/material.dart';

import '../../../../../domain/consts/consts.dart';
import '../../../../widgets/widgets.dart';
import '../../../../../domain/consts/app_consts/filters.dart';
import '../bloc/folders_bloc.dart';

class AllTemplates extends StatefulWidget {
  const AllTemplates({super.key});

  @override
  State<AllTemplates> createState() => _AllTemplatesState();
}

class _AllTemplatesState extends State<AllTemplates> {
  @override
  Widget build(BuildContext context) {
    final color = appColorScheme(context);
    final width = appWidth(context);

    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: CustomIconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.adaptive.arrow_back)),
        title: const CustomText("All Templates"),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: CustomText(
                  'Template List',
                  fontSize: AppFontSize.titleSmallFont,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            getIt<FoldersBloc>().allTemplates.isNotEmpty
                ? SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: getIt<FoldersBloc>().allTemplates.length,
                      (context, index) {
                        final template =
                            getIt<FoldersBloc>().allTemplates[index];
                        final selected = selectedTemplates.contains(index);
                        return Row(
                          children: [
                            selectedTemplates.isNotEmpty
                                ? Checkbox(
                                    value: selected,
                                    onChanged: (value) {
                                      setState(() {
                                        if (value == true) {
                                          selectedTemplates.add(index);
                                        } else {
                                          selectedTemplates.remove(index);
                                        }
                                      });
                                    },
                                  )
                                : const SizedBox.shrink(),
                            Expanded(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    AppStyle.tileBorderRadius,
                                  ),
                                ),
                                child: ListTile(
                                  onLongPress: () {
                                    if (selected) {
                                      selectedTemplates.remove(index);
                                    } else {
                                      selectedTemplates.add(index);
                                    }
                                    setState(() {});
                                  },
                                  contentPadding: const EdgeInsets.all(10),
                                  leading: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        template.name,
                                        fontSize: AppFontSize.titleXSmallFont,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      CustomText(
                                        template.desc,
                                        fontSize: AppFontSize.labelSmallFont,
                                        color: color.outline,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  )
                : const SliverToBoxAdapter(
                    child: CustomText(
                    'No templates Founded',
                    fontSize: AppFontSize.labelSmallFont,
                  )),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: width * .05),
                child: CustomElevatedTextButton(
                  width: double.maxFinite,
                  text: "Save",
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
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
