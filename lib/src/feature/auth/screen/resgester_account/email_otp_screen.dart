



import 'package:direct_drive/config/route_name.dart';
import 'package:direct_drive/src/constant/app_color.dart';
import 'package:direct_drive/src/core/component/costum_elevated_button.dart';
import 'package:direct_drive/src/core/component/custom_input_field.dart';
import 'package:direct_drive/src/core/extension/context_ext._extension.dart';
import 'package:direct_drive/src/core/extension/email_chek_exten.dart';
import 'package:direct_drive/src/feature/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'step_indicator.dart';

class EmailOtpScreen extends StatefulWidget {
  const EmailOtpScreen({super.key});

  @override
  State<EmailOtpScreen> createState() => _EmailOtpScreenState();
}

class _EmailOtpScreenState extends State<EmailOtpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isEmailEntered = false;

    @override
      void dispose() {
 
    emailController.dispose();
  otpController.dispose();
    super.dispose();
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    resizeToAvoidBottomInset: true,
    appBar: AppBar(
      title: const StepIndicator(currentStep: 0),
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
                    /// Title
                    Text(
                      "Enter Email address",
                      style: context.mytexttheme.titleMedium?.copyWith(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 30),

                    /// Email Label
                    Text(
                      "Email",
                      style: context.mytexttheme.titleMedium?.copyWith(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),

                    /// Email Field
                    CustomInputField(
                      controller: emailController,
                      readOnly: isEmailEntered,
                      hintText: "Enter email",
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Email is required";
                        } else if (!value.trim().isValidEmail) {
                          return "Invalid email format";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 30),

                    /// OTP Section
                    if (isEmailEntered) ...[
                      Text(
                        "OTP Code",
                        style: context.mytexttheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Enter the 6 digit code sent to ${emailController.text.trim()}",
                        style: context.mytexttheme.bodyMedium?.copyWith(
                          color: Colors.grey.shade400,
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(height: 15),
                      PinCodeTextField(
                        appContext: context,
                        length: 6,
                        obscureText: true,
                        controller: otpController,
                        keyboardType: TextInputType.number,
                        animationType: AnimationType.fade,
                        cursorColor: Colors.black,
                        enableActiveFill: true,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(8),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeColor: MyColors.primaryColor,
                          selectedColor: MyColors.primaryColor,
                          inactiveColor: Colors.grey.shade200,
                          activeFillColor: Colors.white,
                          selectedFillColor: Colors.grey.shade100,
                          inactiveFillColor: Colors.grey.shade200,
                        ),
                        onChanged: (value) {},
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "OTP is required";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {},
                        child: Center(
                          child: Text(
                            "Resend Code",
                            style: context.mytexttheme.labelMedium?.copyWith(
                              color: MyColors.primaryColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
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
                      if (!isEmailEntered) {
                        setState(() {
                          isEmailEntered = true;
                        });

                         context.read<AuthCubit>().updateEmail(emailController.text.trim());
                      } else{
                        Navigator.pushNamed(context, RouteName.name);
                      }
                    }
                  },
                  buttonText: isEmailEntered ? "Verify OTP" : "Continue",
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
}