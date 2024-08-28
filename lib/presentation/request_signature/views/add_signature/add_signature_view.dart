import 'dart:ui' as ui;
import 'package:dyno_sign/domain/consts/font_size.dart';
import 'package:dyno_sign/domain/consts/styles.dart';
import 'package:dyno_sign/domain/custom_widgets/buttons/custom_elevated_icon_button.dart';
import 'package:dyno_sign/domain/custom_widgets/buttons/custom_elevated_text_button.dart';
import 'package:dyno_sign/domain/custom_widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import '../../../../assets_gen/assets.gen.dart';
import '../../../../domain/consts/global_var.dart';
import '../../../../domain/custom_widgets/buttons/custom_outlined_text_button.dart';
import 'bloc/add_signature_bloc.dart';
import 'bloc/add_signature_event.dart';
import 'bloc/add_signature_state.dart';

class AddSignatureView extends StatelessWidget {
  const AddSignatureView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = appWidth(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Signature'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Choose",
              ),
              Tab(
                text: "Draw",
              ),
              Tab(
                text: "Upload",
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .05),
          child: const TabBarView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[ChooseTab(), DrawTab(), UploadTab()],
          ),
        ),
      ),
    );
  }
}

class ChooseTab extends StatelessWidget {
  const ChooseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddSignatureBloc, AddSignatureState>(
      builder: (context, state) {
        return GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return SignatureCard(
              isSelected: state.selectedSignature == index,
              child: Center(
                  child: Assets.images.splashImg.image(fit: BoxFit.scaleDown)),
              onTap: () {
                context
                    .read<AddSignatureBloc>()
                    .add(OnSignatureSelectionEvent(selectedSign: index));
              },
            );
          },
        );
      },
    );
  }
}

class DrawTab extends StatefulWidget {
  const DrawTab({super.key});

  @override
  State<DrawTab> createState() => _DrawTabState();
}

class _DrawTabState extends State<DrawTab> {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  void _handleClearButtonPressed() {
    signatureGlobalKey.currentState!.clear();
  }

  void _handleSaveButtonPressed() async {
    final data =
        await signatureGlobalKey.currentState!.toImage(pixelRatio: 3.0);
    final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Container(
                color: Colors.grey[300],
                child: Image.memory(bytes!.buffer.asUint8List()),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = appColorScheme(context);
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                      border: Border.all(color: color.outline),
                      borderRadius:
                          BorderRadius.circular(AppStyle.buttonBorderRadius)),
                  child: SfSignaturePad(
                      key: signatureGlobalKey,
                      strokeColor: Colors.black,
                      minimumStrokeWidth: 1.0,
                      maximumStrokeWidth: 4.0))),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                "Make This sign as default",
                fontSize: AppFontSize.titleSmallFont,
                fontWeight: ui.FontWeight.w500,
              ),
              Switch.adaptive(
                value: false,
                onChanged: (value) {},
              )
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CustomText(
                        "Pen Stroke",
                        fontWeight: ui.FontWeight.w500,
                        color: color.outline,
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          3,
                          (index) => CustomElevatedIconButton(
                            height: 30,
                            width: 30,
                            icon: Icons.line_axis,
                            onPressed: () {},
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
                const VerticalDivider(),
                Expanded(
                  child: Column(
                    children: [
                      CustomText(
                        "Pen Color",
                        fontWeight: ui.FontWeight.w500,
                        color: color.outline,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomOutlinedTextButton(
                  width: 100,
                  borderRadius: AppStyle.buttonBorderRadius,
                  borderColor: color.outlineVariant,
                  onPressed: _handleClearButtonPressed,
                  text: 'Cancel',
                  textColor: color.onSurface,
                ),
                CustomElevatedTextButton(
                  width: 100,
                  borderRadius: AppStyle.buttonBorderRadius,
                  onPressed: _handleSaveButtonPressed,
                  text: 'Create',
                )
              ])
        ]));
  }
}

class UploadTab extends StatelessWidget {
  const UploadTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class SignatureCard extends StatelessWidget {
  final bool isSelected;
  final Widget? child;
  final VoidCallback onTap;

  const SignatureCard({
    super.key,
    this.isSelected = false,
    this.child,
    required this.onTap,
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
                                  width: 1.5))
                          : null,
                      color: isSelected
                          ? colorScheme.primary
                          : colorScheme.surface,
                      borderRadius: const BorderRadius.only(
                        bottomRight:
                            Radius.circular(AppStyle.buttonBorderRadius),
                        bottomLeft:
                            Radius.circular(AppStyle.buttonBorderRadius),
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
          ],
        ),
      ),
    );
  }
}
