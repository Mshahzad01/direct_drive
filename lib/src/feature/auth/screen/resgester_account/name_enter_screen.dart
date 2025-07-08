import 'package:direct_drive/config/route_name.dart';
import 'package:direct_drive/src/constant/app_color.dart';
import 'package:direct_drive/src/core/component/costum_elevated_button.dart';
import 'package:direct_drive/src/core/component/custom_input_field.dart';
import 'package:direct_drive/src/core/extension/context_ext._extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/auth_cubit.dart';
import 'step_indicator.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StepIndicator(currentStep: 1),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, RouteName.signIn),
            icon: Text(
              "Sign in",
              style: context.mytexttheme.titleMedium?.copyWith(
                color: MyColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                    top: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Whats your name?",
                        style: context.mytexttheme.titleMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 30),

                      Text(
                        "First name",
                        style: context.mytexttheme.titleMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),

                      CustomInputField(
                        controller: firstNameController,
                        hintText: "First Name",
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "First name is required";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 20),
                      Text(
                        "Last name",
                        style: context.mytexttheme.titleMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomInputField(
                        controller: lastNameController,
                        hintText: "Last Name",
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Last name is required";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButtonWidget(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().updateName(
                          firstNameController.text.trim(),
                          lastNameController.text.trim(),
                        );
                        Navigator.pushNamed(context, RouteName.password);
                      }
                    },
                    buttonText: "Continue",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
