import 'package:flutter/material.dart';

import '../../../../domain/consts/styles.dart';

class SignatureChoiceCard extends StatelessWidget {
  final bool isSelected;
  final Widget? child;
  final VoidCallback onTap;
  final bool indicator;

  const SignatureChoiceCard({
    super.key,
    this.isSelected = false,
    this.child,
    required this.onTap,
    this.indicator = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      shadowColor:
          isSelected ? colorScheme.primary : colorScheme.outlineVariant,
      elevation: 4,
      color: colorScheme.surface,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppStyle.buttonBorderRadius),
        onTap: onTap,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: child ?? Container(),
            ),
            if (isSelected)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      border: !isSelected
                          ? Border(
                              top: BorderSide(
                                color: colorScheme.outlineVariant,
                                width: 1.5,
                              ),
                            )
                          : null,
                      color: isSelected
                          ? colorScheme.primary
                          : colorScheme.surface,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(AppStyle.tileBorderRadius),
                        bottomLeft: Radius.circular(AppStyle.tileBorderRadius),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: colorScheme.surface),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon:
                                Icon(Icons.delete, color: colorScheme.surface),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    )),
              ),
            if (indicator)
              Positioned(
                top: 5,
                left: 5,
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: Card(
                    color: AppStyle.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppStyle.roundedBorder),
                      side: BorderSide(
                        width: 2,
                        color: isSelected
                            ? colorScheme.primary
                            : colorScheme.outlineVariant,
                      ),
                    ),
                    child: isSelected
                        ? Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Icon(
                              Icons.circle_rounded,
                              color: colorScheme.primary,
                              size: 15,
                            ),
                          )
                        : const SizedBox(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
