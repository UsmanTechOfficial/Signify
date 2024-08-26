part of '../bloc/dashboard_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
        // body: Padding(
        //   padding: EdgeInsets.symmetric(horizontal: mWidth(context) * .05),
        //   child: RefreshIndicator(
        //     onRefresh: () async {
        //       return Future<void>.delayed(const Duration(seconds: 3));
        //     },
        //     child: CustomScrollView(
        //       controller: controller.scrollController,
        //       key: const PageStorageKey<String>("homeScrollPosition"),
        //       physics: const AlwaysScrollableScrollPhysics(),
        //       slivers: [
        //         const SliverAppBar(
        //           pinned: false,
        //           floating: true,
        //           expandedHeight: 60.0,
        //           flexibleSpace: FlexibleSpaceBar(
        //             expandedTitleScale: 1.1,
        //             collapseMode: CollapseMode.parallax,
        //             title: CText(
        //               "Home",
        //               size: AppFontSize.titleMediumFont,
        //               weight: FontWeight.w500,
        //               align: TextAlign.center,
        //             ),
        //             centerTitle: true,
        //           ),
        //           leading: Icon(Icons.widgets),
        //         ),
        //         SliverList(
        //           delegate: SliverChildBuilderDelegate(
        //             childCount: 3,
        //             (context, index) {
        //               return Obx(
        //                 () => CategoryTile(
        //                   isSelected: controller
        //                       .homeController.selectedTileIndex.value
        //                       .isEqual(index),
        //                   title: "Doc",
        //                   subtitle: "${index + 5}",
        //                   onTap: () =>
        //                       controller.homeController.selectedTile(index),
        //                 ),
        //               );
        //             },
        //           ),
        //         ),
        //         SliverToBoxAdapter(
        //             child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             const SizedBox(height: 30),
        //             CText(
        //               "Select",
        //               color: colorScheme.onSurface,
        //               size: AppFontSize.titleSmallFont,
        //               weight: FontWeight.w600,
        //             )
        //           ],
        //         )),
        //         SliverGrid(
        //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //             crossAxisCount: 3,
        //             crossAxisSpacing: 2.0,
        //             childAspectRatio: 1.3,
        //           ),
        //           delegate: SliverChildBuilderDelegate(
        //             childCount: 3,
        //             (BuildContext context, int index) {
        //               return Obx(
        //                 () => CategoryCard(
        //                   isSelected: controller
        //                       .homeController.selectedCategoryIndex.value
        //                       .isEqual(index),
        //                   title: "Agreements",
        //                   onTap: () {
        //                     controller.homeController.selectedCategory(index);
        //                   },
        //                 ),
        //               );
        //             },
        //           ),
        //         ),
        //         SliverToBoxAdapter(
        //             child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             const SizedBox(height: 30),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 CText(
        //                   "Agreements",
        //                   color: colorScheme.onSurface,
        //                   size: AppFontSize.titleSmallFont,
        //                   weight: FontWeight.w600,
        //                 ),
        //                 TextButton(
        //                   onPressed: () {},
        //                   child: CText(
        //                     "See all",
        //                     color: colorScheme.primary,
        //                     size: AppFontSize.labelSmallFont,
        //                     weight: FontWeight.w600,
        //                   ),
        //                 ),
        //               ],
        //             )
        //           ],
        //         )),
        //         SliverGrid(
        //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //               crossAxisCount: 2,
        //               // 2 items per row
        //               mainAxisSpacing: 10.0,
        //               // Spacing between rows
        //               crossAxisSpacing: 10.0,
        //               // Spacing between columns
        //               mainAxisExtent: 180),
        //           delegate: SliverChildBuilderDelegate(
        //             (BuildContext context, int index) {
        //               return Obx(
        //                 () => DocCard(
        //                   isSelected: controller
        //                       .homeController.selectedDocIndex.value
        //                       .isEqual(index),
        //                   child: Container(
        //                     color: Colors.green,
        //                   ),
        //                   onTap: () {
        //                     controller.homeController.selectedDoc(index);
        //                   },
        //                 ),
        //               );
        //             },
        //             childCount: 8,
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}

// class CategoryTile extends StatelessWidget {
//   final bool isSelected;
//   final String title;
//   final String subtitle;
//   final Widget? icon;
//   final VoidCallback onTap;
//
//   const CategoryTile({
//     super.key,
//     this.isSelected = false,
//     required this.title,
//     required this.subtitle,
//     this.icon,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;
//
//     return SizedBox(
//       height: 80,
//       child: Card(
//         shadowColor: isSelected ? colorScheme.primary : colorScheme.shadow,
//         elevation: 4,
//         color: isSelected ? colorScheme.primary : colorScheme.surface,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(AppConst.borderRadius),
//           onTap: onTap,
//           child: Center(
//             child: ListTile(
//               leading: CircleAvatar(
//                 child: icon,
//               ),
//               title: CText(
//                 title,
//                 color: isSelected ? colorScheme.surface : null,
//                 size: AppFontSize.titleXSmallFont,
//               ),
//               subtitle: CText(
//                 subtitle,
//                 color: isSelected ? colorScheme.surface : null,
//                 weight: FontWeight.w600,
//                 size: AppFontSize.labelMediumFont,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CategoryCard extends StatelessWidget {
//   final bool isSelected;
//   final String title;
//   final Widget? icon;
//   final VoidCallback onTap;
//
//   const CategoryCard({
//     super.key,
//     this.isSelected = false,
//     required this.title,
//     this.icon,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;
//
//     return Card(
//       shadowColor: isSelected ? colorScheme.primary : colorScheme.shadow,
//       elevation: 4,
//       color: isSelected ? colorScheme.primary : colorScheme.surface,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(AppConst.borderRadius),
//         onTap: onTap,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             CircleAvatar(
//               child: icon,
//             ),
//             CText(
//               title,
//               color: isSelected ? colorScheme.surface : null,
//               weight: FontWeight.w600,
//               size: AppFontSize.labelSmallFont,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class DocCard extends StatelessWidget {
//   final bool isSelected;
//   final Widget? child;
//   final VoidCallback onTap;
//
//   const DocCard({
//     super.key,
//     this.isSelected = false,
//     this.child,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;
//
//     return Card(
//       shadowColor:
//           isSelected ? colorScheme.primary : colorScheme.outlineVariant,
//       elevation: 4,
//       color: colorScheme.surface,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(AppConst.borderRadius),
//         onTap: onTap,
//         child: Stack(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: child ?? Container(),
//             ),
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                   height: 45,
//                   decoration: BoxDecoration(
//                     border: !isSelected
//                         ? Border(
//                             top: BorderSide(
//                                 color: colorScheme.outlineVariant, width: 1.5))
//                         : null,
//                     color:
//                         isSelected ? colorScheme.primary : colorScheme.surface,
//                     borderRadius: const BorderRadius.only(
//                       bottomRight: Radius.circular(AppConst.borderRadius),
//                       bottomLeft: Radius.circular(AppConst.borderRadius),
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         CText(
//                           "Agreements",
//                           size: AppFontSize.labelMediumFont,
//                           weight: FontWeight.w500,
//                           color: isSelected
//                               ? colorScheme.onPrimary
//                               : colorScheme.onSurface,
//                         ),
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.circle,
//                               size: 10,
//                               color: isSelected
//                                   ? colorScheme.onPrimary
//                                   : colorScheme.primaryContainer,
//                             ),
//                             const SizedBox(width: 5),
//                             CText(
//                               "Completed",
//                               size: AppFontSize.labelSmallFont,
//                               color: isSelected
//                                   ? colorScheme.onPrimary
//                                   : colorScheme.onSurface,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
