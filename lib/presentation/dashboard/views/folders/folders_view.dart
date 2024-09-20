import 'package:dyno_sign/infrastructure/dal/models/new_folder.model.dart';
import 'package:dyno_sign/presentation/blocs.dart';
import 'package:dyno_sign/presentation/dashboard/views/folders/view/all_templates.dart';
import 'package:dyno_sign/presentation/widgets/tiles/custom_tiles/custom_folder_tile.dart';
import 'package:flutter/material.dart';

import '../../../../domain/consts/consts.dart';
import '../../../widgets/widgets.dart';
import '../../../../domain/consts/app_consts/filters.dart';

part 'view/create_folder_view.dart';
part 'view/folder_templates_list.dart';

class FoldersView extends StatelessWidget {
  const FoldersView({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final searchController = TextEditingController();
    final width = appWidth(context);
    return Scaffold(
      appBar: AppBar(
        leading: CustomIconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.adaptive.arrow_back)),
        title: const Text("Folders"),
        actions: [
          CustomIconButton(
            padding: 10,
            icon: Icon(Icons.add, color: color.surface),
            backgroundColor: color.primary,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateFolderView(),
                  ));
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kTextTabBarHeight),
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
      body: Container(
        margin: EdgeInsets.all(width * 0.015),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomText(
                  space: 1,
                  'All Folders',
                  fontSize: AppFontSize.titleMSmallFont,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) {
                return CustomFolderTile(
                  index: index,
                  title: 'Folder',
                  onTap: () {},
                  subTitle: 'Amir',
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}

// class FilterSheet extends StatelessWidget {
//   final FoldersBloc bloc;
//
//   const FilterSheet({super.key, required this.bloc});
//
//   @override
//   Widget build(BuildContext context) {
//     final color = appColorScheme(context);
//     return DraggableScrollableSheet(
//       expand: false,
//       builder: (BuildContext context, ScrollController scrollController) {
//         return SingleChildScrollView(
//           controller: scrollController,
//           padding: EdgeInsets.symmetric(horizontal: appWidth(context) * .04),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CustomOutlinedTextButton(
//                     text: "Reset",
//                     borderColor: Colors.transparent,
//                     textColor: color.outline,
//                     onPressed: () {
//                       bloc.add(
//                         const StatusFilterSelectionEvent(
//                           StatusFilters.all,
//                         ),
//                       );
//                       bloc.add(
//                         const DateFilterSelectionEvent(
//                           DateFilters.all,
//                         ),
//                       );
//                     },
//                   ),
//                   CustomOutlinedTextButton(
//                     text: "Apply",
//                     borderColor: color.outlineVariant,
//                     textColor: color.onSurface,
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//               const CustomText(
//                 "Status",
//                 fontWeight: FontWeight.w600,
//                 fontSize: AppFontSize.titleSmallFont,
//               ),
//               BlocBuilder<FoldersBloc, FoldersState>(
//                 buildWhen: (_, current) => current is StatusFilterSelectionState,
//                 builder: (context, state) {
//                   return ListView.builder(
//                     shrinkWrap: true,
//                     controller: scrollController,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: StatusFilters.values.length,
//                     itemBuilder: (context, index) {
//                       final filter = StatusFilters.values[index];
//
//                       if (state is StatusFilterSelectionState) {
//                         bloc.selectedStatusFilter = state.newFilter;
//                       }
//                       return SizedBox(
//                         height: 40,
//                         child: ListTile(
//                           dense: true,
//                           leading: Radio<StatusFilters>.adaptive(
//                             activeColor: appColorScheme(context).primary,
//                             value: filter,
//                             groupValue: bloc.selectedStatusFilter,
//                             onChanged: (newValue) {
//                               context
//                                   .read<FoldersBloc>()
//                                   .add(StatusFilterSelectionEvent(newValue!));
//                             },
//                           ),
//                           title: CustomText(
//                             filter.label,
//                             fontSize: AppFontSize.labelMediumFont,
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//               const CustomText(
//                 "Date",
//                 fontWeight: FontWeight.w600,
//                 fontSize: AppFontSize.titleSmallFont,
//               ),
//               BlocBuilder<FoldersBloc, FoldersState>(
//                 buildWhen: (_, current) => current is DateFilterSelectionState,
//                 builder: (context, state) {
//                   if (state is DateFilterSelectionState) {
//                     bloc.selectedDateFilters = state.newFilter;
//                   }
//                   return ListView.builder(
//                     shrinkWrap: true,
//                     controller: scrollController,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: DateFilters.values.length,
//                     itemBuilder: (context, index) {
//                       final filter = DateFilters.values[index];
//                       return SizedBox(
//                         height: 40,
//                         child: ListTile(
//                           dense: true,
//                           leading: Radio<DateFilters>.adaptive(
//                             activeColor: appColorScheme(context).primary,
//                             value: filter,
//                             groupValue: bloc.selectedDateFilters,
//                             onChanged: (newValue) {
//                               bloc.add(DateFilterSelectionEvent(newValue!));
//                             },
//                           ),
//                           title: CustomText(
//                             filter.label,
//                             fontSize: AppFontSize.labelMediumFont,
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
//
// class FoldersSearchDelegate extends SearchDelegate<String> {
//   final FoldersBloc foldersBloc;
//
//   FoldersSearchDelegate({required this.foldersBloc});
//
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: const Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, '');
//       },
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     foldersBloc.add(SearchFoldersEvent(query));
//
//     return BlocBuilder<FoldersBloc, FoldersState>(
//       bloc: foldersBloc,
//       builder: (context, state) {
//         if (state is SearchLoadingState) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (state is SearchLoadedState) {
//           return ListView.builder(
//             itemCount: state.result.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(state.result[index]),
//                 onTap: () {
//                   close(context, state.result[index]);
//                 },
//               );
//             },
//           );
//         } else if (state is SearchErrorState) {
//           return Center(child: Text(state.message));
//         }
//         return const Center(child: Text('No results found.'));
//       },
//     );
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return const SizedBox.shrink();
//   }
// }
