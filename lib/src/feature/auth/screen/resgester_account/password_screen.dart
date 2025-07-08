import 'package:direct_drive/config/route_name.dart';
import 'package:direct_drive/src/constant/app_color.dart';
import 'package:direct_drive/src/core/component/costum_elevated_button.dart';
import 'package:direct_drive/src/core/component/custom_input_field.dart';
import 'package:direct_drive/src/core/extension/context_ext._extension.dart';
import 'package:direct_drive/src/utills/showerror_diloagbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/auth_cubit.dart';
import '../../cubit/auth_state.dart';

import 'step_indicator.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final passwordController = TextEditingController();
  final confirmpaswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    passwordController.addListener(_updateButtonState);
    confirmpaswordController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    final isPasswordNotEmpty = passwordController.text.trim().isNotEmpty;
    final isConfirmPasswordNotEmpty = confirmpaswordController.text
        .trim()
        .isNotEmpty;

    setState(() {
      isButtonEnabled = isPasswordNotEmpty && isConfirmPasswordNotEmpty;
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmpaswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<AuthCubit>().state is AuthLoading;

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          Utils.showErrorDialog(
            context: context,
            title: "Error",
            message: state.message,
          );
        }
        if (state is AuthSuccess) {
          Navigator.pushReplacementNamed(context, RouteName.home);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const StepIndicator(currentStep: 2),
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
                          "Create Password",
                          style: context.mytexttheme.titleMedium?.copyWith(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 30),

                        Text(
                          "Password",
                          style: context.mytexttheme.titleMedium?.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5),

                        CustomInputField(
                          controller: passwordController,
                          isPassword: true,
                          hintText: "Enter Password",
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Password is required";
                            } else if (value.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),

                        Text(
                          "Confirm Password",
                          style: context.mytexttheme.titleMedium?.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5),

                        CustomInputField(
                          controller: confirmpaswordController,
                          isPassword: true,
                          hintText: "Enter Confirm Password",
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Confirm Password is required";
                            } else if (value.trim() !=
                                passwordController.text.trim()) {
                              return "Passwords do not match";
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
                      isLoading: isLoading,
                      onPressed: isLoading
                          ? null
                          : isButtonEnabled
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthCubit>().updatePassword(
                                  passwordController.text.trim(),
                                );
                                context.read<AuthCubit>().signUpWithEmail();
                              }
                            }
                          : null,
                      buttonText: "Create Account",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
