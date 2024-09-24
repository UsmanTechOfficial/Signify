import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
import 'package:dyno_sign/presentation/pop_up/sign_documents/send_by_others/by_other_agreement_detail/by_other_agreement_detail_view.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/consts/consts.dart';
import '../../../../widgets/widgets.dart';

class ByOtherAgreementListView extends StatelessWidget {
  const ByOtherAgreementListView({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final searchController = TextEditingController();
    final width = appWidth(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: CustomIconButton(
              onPressed: () => Navigator.pop(context), icon: Icon(Icons.adaptive.arrow_back)),
          title: const CustomText("Agreements"),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      clipBehavior: Clip.hardEdge,
                      child: CustomTextFormField(
                        height: 45,
                        controller: searchController,
                        hint: "Search",
                        borderColor: Colors.transparent,
                        filled: true,
                        readOnly: true,
                        prefix: Icons.search_rounded,
                        fillColor: color.surface,
                        suffix: Icon(
                          Icons.filter_alt_outlined,
                          color: color.outline,
                        ),
                        borderRadius: AppStyle.buttonBorderRadius,
                        focusBorderColor: Colors.transparent,
                        onTap: () {
                          showSearch(
                            context: context,
                            delegate: _TemplatesSearchDelegate(),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: ListView.builder(
            itemCount: 10, // Example item count
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Go.to(const ByOtherAgreementDetailView());
                },
                child: SizedBox(
                  height: 85,
                  width: double.infinity,
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppStyle.tileBorderRadius),
                    ),
                    child: ListTile(
                      leading: Container(
                        decoration:
                            const BoxDecoration(color: Color(0xffFEF2CD), shape: BoxShape.circle),
                        padding: const EdgeInsets.all(15),
                        child: CircleAvatar(
                          backgroundColor: const Color(0xffFBBC04),
                          child: Center(
                              child: Icon(
                            Icons.alarm,
                            color: color.surface,
                            size: 18,
                          )),
                        ),
                      ),
                      title: CustomText(
                        "Agreements ${index + 1}",
                        fontSize: AppFontSize.titleXSmallFont,
                        fontWeight: FontWeight.w500,
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(
                            "Sent By Amir Mahmood",
                            color: Color(0xffFBBC04),
                            fontSize: AppFontSize.labelSmallFont,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.start, // Align text to start
                          ),
                          CustomText(
                            "05/03/2024",
                            color: color.outline,
                            fontSize: AppFontSize.labelSmallFont,
                            textAlign: TextAlign.start, // Align text to start
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}

class _TemplatesSearchDelegate extends SearchDelegate<String> {
  _TemplatesSearchDelegate();

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
    // cubit.add(SearchTemplatesEvent(query));

    return const Center(child: Text('No results found.'));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }
}
