import 'package:dyno_sign/infrastructure/dal/models/selected_file.model.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/routes.dart';
import 'package:dyno_sign/presentation/dashboard/views/agreements/bloc/agreements_bloc.dart';
import 'package:dyno_sign/presentation/dashboard/views/home/bloc/home_bloc.dart';
import 'package:dyno_sign/presentation/dashboard/views/profile/bloc/profile_bloc.dart';
import 'package:dyno_sign/presentation/dashboard/views/templates/bloc/templates_bloc.dart';
import 'package:dyno_sign/presentation/pop_up/add_templates/add_template_detail_added/add_template_detail_added_view.dart';
import 'package:dyno_sign/presentation/pop_up/sign_documents/only_for_me/for_me_selected_document/bloc/for_me_selected_doc_bloc.dart';
import 'package:dyno_sign/presentation/pop_up/sign_documents/only_for_me/for_me_selected_document/for_me_selected_doc_view.dart';
import 'package:dyno_sign/presentation/pop_up/sign_documents/send_by_others/by_other_agreement_list/bloc/by_other_agreement_list_bloc.dart';
import 'package:dyno_sign/presentation/pop_up/sign_documents/send_by_others/by_other_agreement_list/by_other_agreement_list_view.dart';
import 'package:dyno_sign/presentation/widgets/bottom_sheets/bottom_sheets.dart';
import 'package:dyno_sign/presentation/widgets/bottom_sheets/custom_bottom_sheet/sheets_widget/add_documents/add_document.sheet.dart';
import 'package:dyno_sign/presentation/widgets/bottom_sheets/custom_bottom_sheet/sheets_widget/sign_selection/sign_selection.sheet.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../assets_gen/assets.gen.dart';
import '../../domain/consts/consts.dart';
import '../../domain/utils/utils.dart';
import '../widgets/dialogs/pdf_preview.dialog.dart';
import 'bloc/dashboard_bloc.dart';
import 'widgets/bottom_nav_bar.dart';
import 'widgets/drawer_items_tile.dart';

final PageController pageController = PageController();

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final color = appColorScheme(context);
    final width = appWidth(context);
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<HomeBloc>()),
          BlocProvider(create: (context) => getIt<TemplatesBloc>()),
          BlocProvider(create: (context) => getIt<AgreementsBloc>()),
          BlocProvider(create: (context) => getIt<ProfileBloc>()),
        ],
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          key: scaffoldKey,
          drawer: _buildDrawer(width, color, context),

          /// [Body]
          body: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: pages,
          ),

          /// [BottomNavigationBar]
          bottomNavigationBar: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              int currentIndex = 0;
              if (state is PageChangedState) {
                currentIndex = state.currentIndex;
              }
              return CustomBottomNavBar(
                index: currentIndex,
                onChange: (index) {
                  pageController.jumpToPage(index);
                  context.read<DashboardBloc>().add(PageChangEvent(index));
                },
              );
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

          /// [FloatingActionButton]
          floatingActionButton: FloatingActionButton(
            elevation: 10,
            onPressed: () => _bottomSheet(context),
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(Icons.add, color: Theme.of(context).colorScheme.surface),
          ),
        ));
  }

  Widget _buildDrawer(double width, ColorScheme color, BuildContext context) {
    return Drawer(
      width: width * 0.75,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DrawerHeader(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Assets.images.splashImg.image(
                  width: 150,
                  fit: BoxFit.contain,
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppStyle.buttonBorderRadius),
                    ),
                    backgroundColor: color.outlineVariant.withOpacity(0.5),
                  ),
                  onPressed: () {
                    scaffoldKey.currentState?.closeDrawer();
                  },
                  icon: Assets.icons.moreIcon
                      .svg(colorFilter: ColorFilter.mode(color.primary, BlendMode.srcIn)),
                ),
              ],
            ),
          ),
          Column(
            children: DrawerTabs.values.map((tab) {
              return BlocBuilder<DashboardBloc, DashboardState>(
                buildWhen: (p, current) => current is PageChangedState,
                builder: (context, state) {
                  int selectedTab = 0;

                  if (state is PageChangedState) {
                    selectedTab = state.currentIndex;
                  }

                  return DrawerItemsTile(
                    isSelected: selectedTab == tab.index,
                    title: tab.label,
                    icon: tab.iconPath,
                    onTap: () {
                      scaffoldKey.currentState?.closeDrawer();
                      selectedTab = tab.index;
                      if (tab.index < 4) {
                        pageController.jumpToPage(selectedTab);
                        context.read<DashboardBloc>().add(PageChangEvent(selectedTab));
                      } else {
                        _navigateToNewPage(tab.index);
                      }
                    },
                  );
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  void _navigateToNewPage(int index) {
    if (index == 4) Go.toNamed(Routes.FOLDERS);
    if (index == 5) Go.toNamed(Routes.SETTINGS);
  }

  /// Shows the first Bottom Sheet when the FloatingActionButton is clicked
  void _bottomSheet(BuildContext context) {
    CustomModelSheet.showBottomSheet(
      context: context,
      title: "Add",
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomBottomSheetTile(
            isSelected: false,
            title: "Request Signature",
            subtitle: 'Request anyone to add signatures in your document',
            onTap: () {
              Go.back();
              _showDocumentSourceSheet(context, SignProcessTypes.requestSignatures);
            },
          ),
          CustomBottomSheetTile(
            isSelected: false,
            title: "Sign Documents",
            subtitle: 'Documents that you want to sign for yourself or sent by others',
            onTap: () {
              Go.back();
              _showSignSelectionSheet(context);
            },
          ),
          CustomBottomSheetTile(
            isSelected: false,
            title: "Add Templates",
            subtitle: 'Make templates and use them again and again.',
            onTap: () {
              Go.to(const AddTemplateDetailAddedView());
            },
          ),
        ],
      ),
    );
  }

  /// Shows the Document Source Selection Sheet
  void _showDocumentSourceSheet(BuildContext context, SignProcessTypes signProcessTypes) {
    CustomModelSheet.showScrolledBottomSheet(
      context: context,
      title: "Add a Document",
      content: AddDocumentSheet(
        onTap: (source) async {
          Go.back();

          switch (source) {
            case DocumentSource.files:
              final pickedFile = await FilePicker.pick();

              if (pickedFile != null) {
                // final pdfFirstPageModel = await PdfFirstPage.get(pickedFile.first);
                final pdfFirstPageModel = await FileToModel.convert(pickedFile.first);
                // if (pdfFirstPageModel != null) {
                _preview(
                    pdfFile: pickedFile.first,
                    signProcessTypes: signProcessTypes,
                    firstPageModel: pdfFirstPageModel);
                // }
              }
              break;

            case DocumentSource.camera:
              final pickedImageModel = await CameraImageToPdfModel.capture();

              if (pickedImageModel != null) {
                _preview(
                    pdfFile: XFile.fromData(pickedImageModel.bytes, name: pickedImageModel.name),
                    signProcessTypes: signProcessTypes,
                    firstPageModel: pickedImageModel);
              }

              break;

            case DocumentSource.gallery:
              final pickedImageModel = await GalleryImageToPdfModel.pick();

              if (pickedImageModel != null) {
                _preview(
                    pdfFile: XFile.fromData(pickedImageModel.bytes, name: pickedImageModel.name),
                    signProcessTypes: signProcessTypes,
                    firstPageModel: pickedImageModel);
              }
            default:
              break;
          }
        },
      ),
    );
  }

  /// Shows the Sign Sheet for self or others
  void _showSignSelectionSheet(BuildContext context) {
    CustomModelSheet.showBottomSheet(
      context: context,
      title: "Sign",
      content: SignSelectedSheet(
        onForMe: () {
          Go.back();
          _showDocumentSourceSheet(context, SignProcessTypes.onlyForMe);
        },
        onByOthers: () {
          Go.back();
          Go.to(
            BlocProvider(
              create: (context) => getIt<ByOtherAgreementListBloc>(),
              child: const ByOtherAgreementListView(),
            ),
          );
        },
      ),
    );
  }

  /// Previews and checks whether to keep or discard the selected file
  void _preview(
      {required XFile pdfFile,
      required SelectedFileModel firstPageModel,
      required SignProcessTypes signProcessTypes}) {
    PdfPreviewDialog.show(
      pdfFile,
      check: (PreviewCheck onCheck) async {
        if (onCheck == PreviewCheck.keep) {
          // final firstPageModel = await PdfFirstPage.get(pdfFile);

          switch (signProcessTypes) {
            case SignProcessTypes.requestSignatures:
              Go.toNamed(Routes.REQ_SIGN_SELECTED_DOC, arguments: firstPageModel);
              break;

            case SignProcessTypes.onlyForMe:
              Go.to(
                BlocProvider(
                  create: (context) => getIt<ForMeSelectedDocBloc>(),
                  child: const ForMeSelectedDocView(),
                ),
              );
              break;

            case SignProcessTypes.sendByOthers:
              Go.to(
                BlocProvider(
                  create: (context) => getIt<ByOtherAgreementListBloc>(),
                  child: const ByOtherAgreementListView(),
                ),
              );
              break;

            default:
              break;
          }
        }
      },
    );
  }
}
