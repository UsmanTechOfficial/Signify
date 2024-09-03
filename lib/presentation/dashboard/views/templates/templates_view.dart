import 'package:dyno_sign/domain/consts/global_var.dart';
import 'package:dyno_sign/domain/consts/styles.dart';
import 'package:dyno_sign/infrastructure/theme/theme_library.dart';
import 'package:dyno_sign/presentation/dashboard/views/templates/bloc/templates_bloc.dart';
import 'package:dyno_sign/presentation/widgets/buttons/custom_icon_button.dart';
import 'package:dyno_sign/presentation/widgets/form_field/custom_formfield.dart';
import 'package:dyno_sign/presentation/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/custom_appbar.dart';

class TemplatesView extends StatelessWidget {
  const TemplatesView({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final searchController = TextEditingController();

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        child: CustomScrollView(
          key: const PageStorageKey<String>("TemplateScrollPosition"),
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            CustomAppbar(
              title: "Templates",
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
                        child: SizedBox(
                          height: 40,
                          child: CustomTextFormField(
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
                                delegate: TemplatesSearchDelegate(
                                  templatesBloc:
                                      BlocProvider.of<TemplatesBloc>(context),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Added spacing between the search bar and the icon
                      CustomIconButton(
                        icon: const Icon(Icons.bar_chart),
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            showDragHandle: true,
                            context: context,
                            builder: (context) {
                              return BlocProvider(
                                create: (context) => TemplatesBloc(),
                                child: const FilterSheet(),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 2000,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FilterSheet extends StatelessWidget {
  const FilterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: appWidth(context) * .04),
      children: [
        const CustomText(
          "Status",
          fontWeight: FontWeight.w600,
          fontSize: AppFontSize.titleSmallFont,
        ),
        Column(
            children: StatusFilters.values
                .map((filter) => SizedBox(
                      height: 40,
                      child: ListTile(
                        dense: true,
                        leading: Radio.adaptive(
                          activeColor: appColorScheme(context).primary,
                          value: filter.index == 0,
                          groupValue: true,
                          onChanged: (value) {},
                        ),
                        title: CustomText(
                          filter.label,
                          fontSize: AppFontSize.labelMediumFont,
                        ),
                      ),
                    ))
                .toList()),
        const CustomText(
          "Date",
          fontWeight: FontWeight.w600,
          fontSize: AppFontSize.titleSmallFont,
        ),
        Column(
            children: DateFilters.values
                .map((filter) => SizedBox(
                      height: 40,
                      child: ListTile(
                        dense: true,
                        leading: Radio.adaptive(
                          activeColor: appColorScheme(context).primary,
                          value: filter.index == 0,
                          groupValue: true,
                          onChanged: (value) {},
                        ),
                        title: CustomText(
                          filter.label,
                          fontSize: AppFontSize.labelMediumFont,
                        ),
                      ),
                    ))
                .toList())
      ],
    );
  }
}

class TemplatesSearchDelegate extends SearchDelegate<String> {
  final TemplatesBloc templatesBloc;

  TemplatesSearchDelegate({required this.templatesBloc});

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
    templatesBloc.add(SearchTemplatesEvent(query));

    return BlocBuilder<TemplatesBloc, TemplatesState>(
      bloc: templatesBloc,
      builder: (context, state) {
        if (state is SearchLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchLoadedState) {
          return ListView.builder(
            itemCount: state.result.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.result[index]),
                onTap: () {
                  close(context, state.result[index]);
                },
              );
            },
          );
        } else if (state is SearchErrorState) {
          return Center(child: Text(state.message));
        }
        return const Center(child: Text('No results found.'));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }
}
