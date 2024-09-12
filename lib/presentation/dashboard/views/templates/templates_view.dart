import 'package:dyno_sign/domain/consts/global_var.dart';
import 'package:dyno_sign/infrastructure/theme/theme.dart';
import 'package:dyno_sign/presentation/dashboard/views/templates/bloc/templates_bloc.dart';
import 'package:dyno_sign/presentation/widgets/buttons/custom_icon_button.dart';
import 'package:dyno_sign/presentation/widgets/buttons/custom_outlined_text_button.dart';
import 'package:dyno_sign/presentation/widgets/form_field/custom_formfield.dart';
import 'package:dyno_sign/presentation/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/filters.dart';

class TemplatesView extends StatelessWidget {
  const TemplatesView({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final searchController = TextEditingController();
    final bloc = getIt<TemplatesBloc>();

    return NestedScrollView(
      key: const PageStorageKey<String>("TemplateScrollPosition"),
      physics: const AlwaysScrollableScrollPhysics(),
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, _) {
        return [
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
                            delegate: _TemplatesSearchDelegate(
                              templatesBloc: BlocProvider.of<TemplatesBloc>(context),
                            ),
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
                            return BlocProvider.value(
                              value: bloc,
                              child: TemplatesFilterSheet(bloc: bloc),
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
        ];
      },
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appWidth(context) * 0.05),
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) {
                return SizedBox(
                    height: 80,
                    width: double.maxFinite,
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppStyle.tileBorderRadius,
                          ),
                        ),
                        child: ListTile(
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomText(
                                "Template ${index + 1}",
                                fontSize: AppFontSize.titleXSmallFont,
                                fontWeight: FontWeight.w500,
                              ),
                              CustomText(
                                "Amir",
                                fontSize: AppFontSize.labelSmallFont,
                                color: color.outline,
                              ),
                            ],
                          ),
                          subtitle: CustomText(
                            "05/03/2024",
                            color: color.outline,
                            fontSize: AppFontSize.labelSmallFont,
                            textAlign: TextAlign.center,
                          ),
                        )));
              },
            ))
          ],
        ),
      ),
    );
  }
}

class TemplatesFilterSheet extends StatelessWidget {
  final TemplatesBloc bloc;

  const TemplatesFilterSheet({super.key, required this.bloc});

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
                    onPressed: () {
                      bloc.add(
                        const StatusFilterSelectionEvent(
                          StatusFilters.all,
                        ),
                      );
                      bloc.add(
                        const DateFilterSelectionEvent(
                          DateFilters.all,
                        ),
                      );
                    },
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
              BlocBuilder<TemplatesBloc, TemplatesState>(
                buildWhen: (_, current) => current is StatusFilterSelectionState,
                builder: (context, state) {
                  return ListView.builder(
                    shrinkWrap: true,
                    controller: scrollController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: StatusFilters.values.length,
                    itemBuilder: (context, index) {
                      final filter = StatusFilters.values[index];

                      if (state is StatusFilterSelectionState) {
                        bloc.selectedStatusFilter = state.newFilter;
                      }
                      return SizedBox(
                        height: 40,
                        child: ListTile(
                          dense: true,
                          leading: Radio<StatusFilters>.adaptive(
                            activeColor: appColorScheme(context).primary,
                            value: filter,
                            groupValue: bloc.selectedStatusFilter,
                            onChanged: (newValue) {
                              context
                                  .read<TemplatesBloc>()
                                  .add(StatusFilterSelectionEvent(newValue!));
                            },
                          ),
                          title: CustomText(
                            filter.label,
                            fontSize: AppFontSize.labelMediumFont,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              const CustomText(
                "Date",
                fontWeight: FontWeight.w600,
                fontSize: AppFontSize.titleSmallFont,
              ),
              BlocBuilder<TemplatesBloc, TemplatesState>(
                buildWhen: (_, current) => current is DateFilterSelectionState,
                builder: (context, state) {
                  if (state is DateFilterSelectionState) {
                    bloc.selectedDateFilters = state.newFilter;
                  }
                  return ListView.builder(
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
                            groupValue: bloc.selectedDateFilters,
                            onChanged: (newValue) {
                              bloc.add(DateFilterSelectionEvent(newValue!));
                            },
                          ),
                          title: CustomText(
                            filter.label,
                            fontSize: AppFontSize.labelMediumFont,
                          ),
                        ),
                      );
                    },
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

class _TemplatesSearchDelegate extends SearchDelegate<String> {
  final TemplatesBloc templatesBloc;

  _TemplatesSearchDelegate({required this.templatesBloc});

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
