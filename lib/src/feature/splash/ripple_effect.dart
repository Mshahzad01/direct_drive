import 'package:flutter/material.dart';

class RippleEffectContainer extends StatelessWidget {
  final double radius;
  final Color color;
  final double opacity;

  const RippleEffectContainer({
    super.key,
    required this.radius,
    required this.color,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
