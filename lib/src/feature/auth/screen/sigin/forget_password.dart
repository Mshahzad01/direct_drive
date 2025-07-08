import 'package:direct_drive/src/core/component/costum_elevated_button.dart';
import 'package:direct_drive/src/core/component/custom_input_field.dart';
import 'package:direct_drive/src/core/extension/context_ext._extension.dart';
import 'package:direct_drive/src/feature/auth/cubit/auth_cubit.dart';
import 'package:direct_drive/src/feature/auth/cubit/auth_state.dart';
import 'package:direct_drive/src/utills/showerror_diloagbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _NameScreenState();
}

class _NameScreenState extends State<ForgetPassword> {
  final forgetppsswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    forgetppsswordController.dispose();

    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {


  final isloding =   context.watch<AuthCubit>().state is AuthLoading;
    return BlocListener<AuthCubit,AuthState>(
      listener: ( context, state) {  
      if(state is AuthFailure){
         
         Utils.showErrorDialog(context: context,title: "Error", message: state.message);

      }

      if(state is AuthInitial){

        Utils.showErrorDialog(context: context,title: "Sucessful Link Sent", message: "Please Chek your email send link to click the link and rest your password");
      }

      },
      child: Scaffold(
        appBar: AppBar(),
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
                          "Forget Password",
                          style: context.mytexttheme.titleMedium?.copyWith(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 05),
      
                        /// Email Label
                        Text(
                          "Enter your Email address and you used to rigister to reset your new password",
                          style: context.mytexttheme.titleMedium?.copyWith(
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 20),
      
                        Text(
                          "Password",
                          style: context.mytexttheme.titleMedium?.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
      
                        const SizedBox(height: 05),
      
                        CustomInputField(
                          controller: forgetppsswordController,
                          hintText: "Enter Email",
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Email is required";
                            }
                            return null;
                          },
                        ),
      
                        SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: CustomElevatedButtonWidget(
                            isLoading: isloding,
                            onPressed: isloding ? null :
                            
                            
                            () {
                              if (_formKey.currentState!.validate()) {
                              
      
                                context.read<AuthCubit>().restpassword(forgetppsswordController.text.trim());
                               // Navigator.pushNamed(context, RouteName.password);
                              }
                            },
                            buttonText: "Continue",
                          ),
                        ),
                      ],
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
