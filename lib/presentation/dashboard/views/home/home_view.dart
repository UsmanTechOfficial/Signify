import 'package:dyno_sign/domain/consts/global_var.dart';
import 'package:dyno_sign/presentation/dashboard/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../assets_gen/assets.gen.dart';
import '../../../../domain/consts/font_size.dart';
import '../../../../domain/consts/styles.dart';
import '../../../widgets/text/custom_text.dart';
import 'bloc/home_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return NestedScrollView(
      floatHeaderSlivers: true,
      physics: const AlwaysScrollableScrollPhysics(),
      key: const PageStorageKey<String>("homeScrollPosition"),
      headerSliverBuilder: (BuildContext context, bool _) {
        return <Widget>[
          const CustomAppbar(title: 'Home'),
        ];
      },
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appWidth(context) * 0.05),
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 3,
                (context, index) {
                  return CategoryTile(
                    title: "Doc",
                    icon: Assets.icons.docIcon.svg(),
                    subtitle: "${index + 5}",
                    onTap: () {},
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  CustomText(
                    "Select",
                    color: colorScheme.onSurface,
                    fontSize: AppFontSize.titleSmallFont,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                mainAxisExtent: 100,
              ),
              delegate: SliverChildBuilderDelegate(
                childCount: SelectedDocumentType.values.length,
                (BuildContext context, int index) {
                  return BlocBuilder<HomeBloc, HomeState>(
                    buildWhen: (previous, current) => current is HomeCategorySelectedState,
                    builder: (context, state) {
                      if (state is HomeCategorySelectedState) {
                        return CategoryCard(
                          isSelected: state.selectedCategoryIndex == index,
                          title: SelectedDocumentType.values[index].type,
                          icon: Assets.icons.docIcon.svg(),
                          onTap: () {
                            context.read<HomeBloc>().add(SelectCategory(index));
                          },
                        );
                      }
                      return CategoryCard(
                        isSelected: index == 0,
                        title: SelectedDocumentType.values[index].type,
                        icon: Assets.icons.docIcon.svg(),
                        onTap: () => context.read<HomeBloc>().add(SelectCategory(index)),
                      );
                    },
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<HomeBloc, HomeState>(
                        buildWhen: (previous, current) => current is HomeCategorySelectedState,
                        builder: (context, state) {
                          if (state is HomeCategorySelectedState) {
                            return CustomText(
                              SelectedDocumentType.values[state.selectedCategoryIndex].type,
                              color: colorScheme.onSurface,
                              fontSize: AppFontSize.titleSmallFont,
                              fontWeight: FontWeight.w600,
                            );
                          }
                          return CustomText(
                            "Agreements",
                            color: colorScheme.onSurface,
                            fontSize: AppFontSize.titleSmallFont,
                            fontWeight: FontWeight.w600,
                          );
                        },
                      ),
                      TextButton(
                        onPressed: () {},
                        child: CustomText(
                          "See all",
                          color: colorScheme.primary,
                          fontSize: AppFontSize.labelSmallFont,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                int currentIndex = 0;

                // Check if the current state is HomeCategorySelectedState
                if (state is HomeCategorySelectedState) {
                  currentIndex = state.selectedCategoryIndex;
                }

                return SliverToBoxAdapter(
                  child: IndexedStack(
                    index: currentIndex,
                    children: [
                      if (context.read<HomeBloc>().agreementsList.isEmpty)
                        const Center(
                          child: Text(
                            "No agreements found",
                          ),
                        )
                      else
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                            mainAxisExtent: 200,
                          ),
                          itemCount: context.read<HomeBloc>().agreementsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            bool isSelected = false;
                            if (state is HomeDocSelectedState) {
                              isSelected = state.selectedDocIndex == index;
                            }
                            return DocCard(
                              isSelected: isSelected,
                              child: Container(
                                color: Colors.green,
                              ),
                              onTap: () {
                                context.read<HomeBloc>().add(SelectDoc(index));
                              },
                            );
                          },
                        ),
                      if (context.read<HomeBloc>().templateList.isEmpty)
                        const Center(
                          child: Text(
                            "No templates found",
                          ),
                        )
                      else
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                            mainAxisExtent: 200,
                          ),
                          itemCount: context.read<HomeBloc>().templateList.length,
                          itemBuilder: (BuildContext context, int index) {
                            bool isSelected = false;
                            if (state is HomeDocSelectedState) {
                              isSelected = state.selectedDocIndex == index;
                            }
                            return DocCard(
                              isSelected: isSelected,
                              child: Container(
                                color: Colors.green,
                              ),
                              onTap: () {
                                context.read<HomeBloc>().add(SelectDoc(index));
                              },
                            );
                          },
                        ),
                      if (context.read<HomeBloc>().foldersList.isEmpty)
                        const Center(
                          child: Text(
                            "No folders found",
                          ),
                        )
                      else
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                            mainAxisExtent: 200,
                          ),
                          itemCount: context.read<HomeBloc>().foldersList.length,
                          itemBuilder: (BuildContext context, int index) {
                            bool isSelected = false;
                            if (state is HomeDocSelectedState) {
                              isSelected = state.selectedDocIndex == index;
                            }
                            return DocCard(
                              isSelected: isSelected,
                              child: Container(
                                color: Colors.green,
                              ),
                              onTap: () {
                                context.read<HomeBloc>().add(SelectDoc(index));
                              },
                            );
                          },
                        ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String subtitle;
  final Widget? icon;
  final VoidCallback onTap;

  const CategoryTile({
    super.key,
    this.isSelected = false,
    required this.title,
    required this.subtitle,
    this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 80,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppStyle.tileBorderRadius,
          ),
        ),
        shadowColor: colorScheme.shadow,
        elevation: 2,
        color: colorScheme.surface,
        child: InkWell(
          borderRadius: BorderRadius.circular(
            AppStyle.tileBorderRadius,
          ),
          onTap: onTap,
          child: ListTile(
            selected: isSelected,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppStyle.tileBorderRadius)),
            leading: CircleAvatar(
              backgroundColor: colorScheme.secondaryContainer,
              child: icon,
            ),
            title: CustomText(
              title,
              color: isSelected ? colorScheme.surface : null,
              fontSize: AppFontSize.titleXSmallFont,
            ),
            subtitle: CustomText(
              subtitle,
              color: isSelected ? colorScheme.surface : null,
              fontWeight: FontWeight.w600,
              fontSize: AppFontSize.labelMediumFont,
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final bool isSelected;
  final String title;
  final Widget? icon;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    this.isSelected = false,
    required this.title,
    this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppStyle.tileBorderRadius)),
      shadowColor: isSelected ? colorScheme.primary : colorScheme.shadow,
      elevation: 4,
      color: isSelected ? colorScheme.primary : colorScheme.surface,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppStyle.tileBorderRadius),
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              backgroundColor: isSelected ? colorScheme.onPrimary : colorScheme.secondaryContainer,
              child: icon,
            ),
            CustomText(
              title,
              color: isSelected ? colorScheme.surface : null,
              fontWeight: FontWeight.w600,
              fontSize: AppFontSize.labelSmallFont,
            ),
          ],
        ),
      ),
    );
  }
}

class DocCard extends StatelessWidget {
  final double? width;
  final double? height;
  final bool isSelected;
  final Widget? child;
  final VoidCallback onTap;
  final String? bottomChild;

  const DocCard({
    super.key,
    this.isSelected = false,
    this.child,
    required this.onTap,
    this.width,
    this.height,
    this.bottomChild,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      shadowColor: isSelected ? colorScheme.primary : colorScheme.outlineVariant,
      elevation: 4,
      color: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppStyle.tileBorderRadius),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppStyle.tileBorderRadius),
        onTap: onTap,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: child ?? Container(),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    border: !isSelected
                        ? Border(
                            top: BorderSide(
                              color: colorScheme.outlineVariant,
                              width: 1.5,
                            ),
                          )
                        : null,
                    color: isSelected ? colorScheme.primary : colorScheme.surface,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(AppStyle.tileBorderRadius),
                      bottomLeft: Radius.circular(
                        AppStyle.tileBorderRadius,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomText(
                          "Agreements",
                          fontSize: AppFontSize.labelMediumFont,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? colorScheme.onPrimary : colorScheme.onSurface,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              size: 10,
                              color:
                                  isSelected ? colorScheme.onPrimary : colorScheme.primaryContainer,
                            ),
                            const SizedBox(width: 5),
                            CustomText(
                              bottomChild ?? "Completed",
                              fontSize: AppFontSize.labelSmallFont,
                              color: isSelected ? colorScheme.onPrimary : colorScheme.outline,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

enum SelectedDocumentType {
  agreements('Agreements'),
  templates('Templates'),
  folders('Folders');

  final String type;

  const SelectedDocumentType(this.type);
}