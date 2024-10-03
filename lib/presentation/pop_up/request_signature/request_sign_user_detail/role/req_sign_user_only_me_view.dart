import 'package:flutter/material.dart';

import '../../../../../domain/consts/consts.dart';
import '../../../../widgets/widgets.dart';
import '../../../widgets/recipient_card.dart';

class ReqSignUserOnlyMeView extends StatelessWidget {
  const ReqSignUserOnlyMeView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = appWidth(context);
    final color = appColorScheme(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agreement Detail'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .05),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: CustomOutlinedTextButton(
                  onPressed: () {
                    // bloc.add(const NextNavigateEvent());
                  },
                  text: 'Next',
                  borderRadius: AppStyle.outlinedBtnRadius,
                ),
              ),
              const SizedBox(height: 20),
              // Separate BlocBuilder for Signers List
              CustomText(
                "Recipients List",
                fontSize: AppFontSize.titleMSmallFont,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 10),

              SignerCard(
                order: false,
                name: 'Amir',
                email: 'amir@gmail.com',
                status: 'Need to sign',
                index: 1,
                isMe: true,
                onSelected: (value) {},
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
