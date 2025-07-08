import 'package:flutter/material.dart';
import 'package:direct_drive/src/constant/app_color.dart';
import 'package:direct_drive/src/core/extension/context_ext._extension.dart';

class CustomInputField extends StatefulWidget {
  final TextEditingController controller;
  final bool readOnly;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool isPassword;

  const CustomInputField({
    super.key,
    required this.controller,
    this.readOnly = false,
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    this.validator,
    this.isPassword = false,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      readOnly: widget.readOnly,
      obscureText: widget.isPassword ? !isPasswordVisible : false,
      keyboardType: widget.keyboardType,
      style: TextStyle(
        color: widget.readOnly ? Colors.grey.shade400 : Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: context.mytexttheme.titleMedium?.copyWith(
          color: Colors.grey.shade400,
          fontSize: 14,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.primaryColor),
          borderRadius: BorderRadius.circular(16),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      validator: widget.validator,
    );
  }
}
