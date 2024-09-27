import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
import 'package:dyno_sign/presentation/pop_up/request_signature/request_sign_assign_fields/req_sign_assign_fields_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/consts/consts.dart';
import '../../../../widgets/widgets.dart';
import '../../../custom_widgets/recipient_card.dart';
import '../bloc/req_sign_recipient_detail_bloc.dart';

class ReqSignRecipientDetailView extends StatelessWidget {
  const ReqSignRecipientDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ReqSignRecipientDetailBloc>();
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
                    Go.to(const ReqSignAssignFieldsView());
                  },
                  text: 'Next',
                  borderRadius: AppStyle.outlinedBtnRadius,
                ),
              ),
              const SizedBox(height: 20),

              // Set Signing Order with switch
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const CustomText(
                  "Set Signing Order",
                  fontSize: AppFontSize.bodyMediumFont,
                  fontWeight: FontWeight.w500,
                ),
                trailing: Transform.scale(
                  scale: 0.8,
                  child: BlocBuilder<ReqSignRecipientDetailBloc, ReqSignRecipientDetailState>(
                    builder: (context, state) {
                      if (state is RecipientAddedState) {
                        return Switch.adaptive(
                          value: state.order,
                          onChanged: (value) {
                            bloc.add(RecipientOrderEvent(value));
                          },
                        );
                      }

                      return Switch.adaptive(
                        value: false,
                        onChanged: (value) {
                          bloc.add(RecipientOrderEvent(value));
                        },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Recipients List
              const CustomText(
                "Recipients List",
                fontSize: AppFontSize.titleMSmallFont,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 10),

              BlocBuilder<ReqSignRecipientDetailBloc, ReqSignRecipientDetailState>(
                builder: (context, state) {
                  if (state is RecipientAddedState) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.recipientList.length,
                      itemBuilder: (context, index) {
                        return RecipientCard(
                          order: state.order,
                          name: 'Amir',
                          email: 'amir@gmail.com',
                          status: 'need to sign',
                          index: index + 1,
                          isMe: false,
                        );
                      },
                    );
                  }
                  return const CustomText(
                    'No recipient added yet',
                    textAlign: TextAlign.center,
                    fontSize: AppFontSize.labelMediumFont,
                  );
                },
              ),
              const SizedBox(height: 20),
              // Button to add another recipient
              CustomElevatedTextButton(
                width: double.maxFinite,
                text: "Add Recipient",
                borderRadius: AppStyle.buttonBorderRadius,
                onPressed: () {
                  bloc.add(const AddNewRecipientEvent(['Amir']));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _showAdaptiveDialog(BuildContext context) async {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  // Form key to validate inputs
  final formKey = GlobalKey<FormState>();

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog.adaptive(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Enter Your Details',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        content: Form(
          key: formKey, // Form key for validation
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Name Input Field
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  prefixIcon: const Icon(Icons.person),
                  hintText: 'Enter your name',
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Email Input Field
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  prefixIcon: const Icon(Icons.email),
                  hintText: 'Enter your email',
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          // Cancel Button
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),

          // Submit Button with Validation
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                // If the form is valid, display the name and email
                print('Name: ${nameController.text}');
                print('Email: ${emailController.text}');
                Navigator.of(context).pop();
              }
            },
            child: const Text('Submit'),
          ),
        ],
      );
    },
  );
}
