import 'package:dyno_sign/domain/consts/app_consts/sign_process_types.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/routes.dart';
import 'package:dyno_sign/presentation/signing_process/bloc/signing_process_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/consts/consts.dart';
import '../widgets/widgets.dart';

class AgreementsFromOthers extends StatelessWidget {
  final SignProcessTypes signProcessTypes;

  const AgreementsFromOthers({super.key, required this.signProcessTypes});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final searchController = TextEditingController();
    final width = appWidth(context);
    final cubit = getIt<SigningProcessCubit>();
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
                        height: 40,
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
                            delegate: _TemplatesSearchDelegate(cubit: cubit),
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
                  Go.toNamed(Routes.AGREEMENT_OVERVIEW, arguments: {
                    'signProcessTypes': SignProcessTypes.sendByOthers,
                  });
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
  final SigningProcessCubit cubit;

  _TemplatesSearchDelegate({required this.cubit});

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

    return BlocBuilder<SigningProcessCubit, SigningProcessState>(
      bloc: cubit,
      builder: (context, state) {
        // if (state is SearchLoadingState) {
        //   return const Center(child: CircularProgressIndicator());
        // } else if (state is SearchLoadedState) {
        //   return ListView.builder(
        //     itemCount: state.result.length,
        //     itemBuilder: (context, index) {
        //       return ListTile(
        //         title: Text(state.result[index]),
        //         onTap: () {
        //           close(context, state.result[index]);
        //         },
        //       );
        //     },
        //   );
        // } else if (state is SearchErrorState) {
        //   return Center(child: Text(state.message));
        // }
        return const Center(child: Text('No results found.'));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }
}
