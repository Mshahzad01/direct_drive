import 'package:direct_drive/src/constant/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  const CustomElevatedButtonWidget({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.color = MyColors.primaryColor,
    this.textColor = Colors.white,
    this.height = 60,
    this.width,
    this.active = true,
    this.isLoading = false,
    this.fontSize = 16,
    this.borderRadius = 10,
    this.fontWeight = FontWeight.w800,
  });

  final Function()? onPressed;
  final String buttonText;
  final Color color;
  final Color textColor;
  final double height;
  final double? width;
  final bool active;
  final bool isLoading;
  final double fontSize;
  final double borderRadius;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          disabledBackgroundColor: Colors.grey.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: active && !isLoading ? onPressed : null,
        child: isLoading
            ? const CupertinoActivityIndicator(
                color: Colors.white, // ✅ Fixed color (no dark mode logic)
              )
            : Text(
                buttonText,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: fontWeight,
                      color: textColor,
                      fontSize: fontSize,
                    ),
              ),
      ),
    );
  }
}
