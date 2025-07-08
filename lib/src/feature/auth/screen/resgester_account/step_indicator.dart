import 'package:direct_drive/src/constant/app_color.dart';
import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;

  const StepIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 40,
          height: 6,
          decoration: BoxDecoration(
            color: index <= currentStep
                ? MyColors.primaryColor
                : Colors.grey[300],
            borderRadius: BorderRadius.circular(5),
          ),
        );
      }),
    );
  }
}
