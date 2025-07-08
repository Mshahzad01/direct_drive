import 'package:direct_drive/config/route_name.dart';
import 'package:flutter/material.dart';
import 'package:direct_drive/src/constant/app_color.dart';
import 'package:direct_drive/src/core/extension/context_ext._extension.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double buttonHeight = size.height * 0.07;
    final double buttonWidth = size.width / 2.3;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          SizedBox(
            height: size.height,
            width: size.width,
            child: Image.asset(
              "assets/images/onboarding.png",
              fit: BoxFit.cover,
            ),
          ),

          Container(
            height: size.height,
            width: size.width,
            color: Colors.black.withOpacity(0.4),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.25,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black, Colors.transparent],
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, size.height * 0.04),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Texts
                  Row(
                    children: [
                      Text(
                        "A",
                        style: context.mytexttheme.titleLarge?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        " ride-sharing",
                        style: context.mytexttheme.titleLarge?.copyWith(
                          color: MyColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "service that's",
                    style: context.mytexttheme.titleLarge?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "better for ",
                        style: context.mytexttheme.titleLarge?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "our",
                        style: context.mytexttheme.titleLarge?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "planet",
                    style: context.mytexttheme.titleLarge?.copyWith(
                      color: Colors.grey,
                    ),
                  ),

                  SizedBox(height: size.height * 0.04),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(
                        width: buttonWidth,
                        height: buttonHeight,
                        label: "Get Started",
                        context: context,
                        onTap: () =>
                            Navigator.pushNamed(context, RouteName.emailOtp),
                        filled: true,
                      ),
                      const SizedBox(width: 10),
                      // Sign In Button
                      _buildButton(
                        width: buttonWidth,
                        height: buttonHeight,
                        label: "Sign In",
                        context: context,
                        onTap: () =>
                            Navigator.pushNamed(context, RouteName.signIn),
                        filled: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required double width,
    required double height,
    required String label,
    required BuildContext context,
    required VoidCallback onTap,
    required bool filled,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: filled ? MyColors.primaryColor : Colors.transparent,
          border: Border.all(color: MyColors.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: context.mytexttheme.labelMedium?.copyWith(
              color: filled ? Colors.white : MyColors.primaryColor,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
