import 'dart:ui' as ui;
import 'package:dyno_sign/domain/consts/font_size.dart';
import 'package:dyno_sign/domain/consts/styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import '../../domain/consts/global_var.dart';
import '../widgets/buttons/custom_elevated_text_button.dart';
import '../widgets/buttons/custom_outlined_text_button.dart';
import '../widgets/text/custom_text.dart';
import '../request_signature/widgets/add_signature_widgets/custom_pen_color.dart';
import '../request_signature/widgets/add_signature_widgets/custom_pen_stroke.dart';
import '../request_signature/widgets/add_signature_widgets/pen_tools.dart';
import '../request_signature/widgets/add_signature_widgets/signature_choice_card.dart';
import 'bloc/signature_manager_bloc.dart';
import 'bloc/signature_manager_event.dart';
import 'bloc/signature_manager_state.dart';

class SignatureManagerView extends StatelessWidget {
  const SignatureManagerView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = appWidth(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _appBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .05),
          child: const TabBarView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              ChooseTab(),
              DrawTab(),
              UploadTab(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('Add Signature'),
      centerTitle: true,
      bottom: const TabBar(
        tabs: <Widget>[
          Tab(text: "Choose"),
          Tab(text: "Draw"),
          Tab(text: "Upload"),
        ],
      ),
    );
  }
}

class ChooseTab extends StatelessWidget {
  const ChooseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignatureManagerBloc, SignatureManagerState>(
      buildWhen: (previous, current) {
        return current is OnSignatureSelectedState;
      },
      builder: (context, state) {
        if (state is OnSignatureSelectedState) {
          context.read<SignatureManagerBloc>().selectedSign =
              state.selectedSignature;
        }

        return GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (_, index) {
            return SignatureChoiceCard(
              indicator: true,
              isSelected:
                  context.read<SignatureManagerBloc>().selectedSign == index,
              child: Center(
                child: Image.asset('assets/images/splash_img.png',
                    fit: BoxFit.scaleDown),
              ),
              onTap: () {
                context
                    .read<SignatureManagerBloc>()
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
    final bloc = context.read<SignatureManagerBloc>();
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
                    BorderRadius.circular(AppStyle.buttonBorderRadius),
              ),
              child: BlocBuilder<SignatureManagerBloc, SignatureManagerState>(
                buildWhen: (previous, current) {
                  return current is OnPenColorSelectionState ||
                      current is OnPenStrokeSelectionState;
                },
                builder: (context, state) {
                  if (state is OnPenColorSelectionState) {
                    bloc.selectedColor = state.selectedColor;
                  }
                  if (state is OnPenStrokeSelectionState) {
                    bloc.selectedStroke = state.selectedStroke;
                  }
                  return SfSignaturePad(
                    key: signatureGlobalKey,
                    strokeColor: bloc.selectedColor.color,
                    minimumStrokeWidth: bloc.selectedStroke.stroke.toDouble(),
                    maximumStrokeWidth: PenStroke.bold.stroke.toDouble(),
                  );
                },
              ),
            ),
          ),
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
                        child: BlocBuilder<SignatureManagerBloc,
                            SignatureManagerState>(
                          buildWhen: (previous, current) {
                            return current is OnPenStrokeSelectionState;
                          },
                          builder: (_, state) {
                            if (state is OnPenStrokeSelectionState) {
                              bloc.selectedStroke = state.selectedStroke;
                            }
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                3,
                                (index) => InkWell(
                                  onTap: () {
                                    bloc.add(OnPenStrokeSelectionEvent(
                                        penStroke: PenStroke.values[index]));
                                  },
                                  child: CustomPenStroke(
                                    selectedStroke: bloc.selectedStroke.index,
                                    penStroke: PenStroke.values[index],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
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
                      ),
                      Expanded(
                        child: BlocBuilder<SignatureManagerBloc,
                            SignatureManagerState>(
                          buildWhen: (previous, current) {
                            return current is OnPenColorSelectionState;
                          },
                          builder: (_, state) {
                            if (state is OnPenColorSelectionState) {
                              bloc.selectedColor = state.selectedColor;
                            }
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                4,
                                (index) => InkWell(
                                  onTap: () {
                                    bloc.add(OnPenColorSelectionEvent(
                                        penColor: PenColors.values[index]));
                                  },
                                  child: CustomPenColor(
                                    selectedColor: bloc.selectedColor.index,
                                    penColors: PenColors.values[index],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
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
                text: 'Clear',
                textColor: color.onSurface,
              ),
              CustomElevatedTextButton(
                width: 100,
                borderRadius: AppStyle.buttonBorderRadius,
                onPressed: _handleSaveButtonPressed,
                text: 'Create',
              )
            ],
          ),
        ],
      ),
    );
  }
}

class UploadTab extends StatelessWidget {
  const UploadTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
