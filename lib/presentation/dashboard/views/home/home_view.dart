import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../assets_gen/assets.gen.dart';
import '../../../../domain/consts/font_size.dart';
import '../../../../domain/consts/styles.dart';
import '../../../../domain/custom_widgets/text/custom_text.dart';
import 'bloc/home_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    // final height = appHeight(context);
    // final width = appWidth(context);
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            return Future<void>.delayed(const Duration(seconds: 3));
          },
          child: CustomScrollView(
            key: const PageStorageKey<String>("homeScrollPosition"),
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              const SliverAppBar(
                pinned: false,
                floating: true,
                expandedHeight: 60.0,
                flexibleSpace: FlexibleSpaceBar(
                  expandedTitleScale: 1.1,
                  collapseMode: CollapseMode.parallax,
                  title: CustomText(
                    "Home",
                    fontSize: AppFontSize.titleMediumFont,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                  ),
                  centerTitle: true,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 3,
                  (context, index) {
                    return BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        return CategoryTile(
                          title: "Doc",
                          icon: Assets.icons.docIcon.svg(),
                          subtitle: "${index + 5}",
                          onTap: () =>
                              context.read<HomeBloc>().add(SelectTile(index)),
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
                    CustomText(
                      "Select",
                      color: colorScheme.onSurface,
                      fontSize: AppFontSize.titleSmallFont,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
              ),
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                    mainAxisExtent: 100),
                delegate: SliverChildBuilderDelegate(
                  childCount: 3,
                  (BuildContext context, int index) {
                    return BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        return CategoryCard(
                          isSelected: state.selectedCategoryIndex == index,
                          title: "Agreements",
                          icon: Assets.icons.docIcon.svg(),
                          onTap: () => context
                              .read<HomeBloc>()
                              .add(SelectCategory(index)),
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
                        CustomText(
                          "Agreements",
                          color: colorScheme.onSurface,
                          fontSize: AppFontSize.titleSmallFont,
                          fontWeight: FontWeight.w600,
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
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  mainAxisExtent: 200,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        return DocCard(
                          isSelected: state.selectedDocIndex == index,
                          child: Container(
                            color: Colors.green,
                          ),
                          onTap: () =>
                              context.read<HomeBloc>().add(SelectDoc(index)),
                        );
                      },
                    );
                  },
                  childCount: 8,
                ),
              ),
            ],
          ),
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
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppStyle.tileBorderRadius)),
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
              backgroundColor: isSelected
                  ? colorScheme.onPrimary
                  : colorScheme.secondaryContainer,
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

  const DocCard({
    super.key,
    this.isSelected = false,
    this.child,
    required this.onTap,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      shadowColor:
          isSelected ? colorScheme.primary : colorScheme.outlineVariant,
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
                    color:
                        isSelected ? colorScheme.primary : colorScheme.surface,
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
                          color: isSelected
                              ? colorScheme.onPrimary
                              : colorScheme.onSurface,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              size: 10,
                              color: isSelected
                                  ? colorScheme.onPrimary
                                  : colorScheme.primaryContainer,
                            ),
                            const SizedBox(width: 5),
                            CustomText(
                              "Completed",
                              fontSize: AppFontSize.labelSmallFont,
                              color: isSelected
                                  ? colorScheme.onPrimary
                                  : colorScheme.onSurface,
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
