import 'package:direct_drive/config/route_name.dart';
import 'package:direct_drive/src/constant/asset_string.dart';
import 'package:direct_drive/src/feature/splash/ripple_effect.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Animationscree extends StatefulWidget {
  const Animationscree({super.key});

  @override
  State<Animationscree> createState() => _AnimationscreeState();
}

class _AnimationscreeState extends State<Animationscree>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.5,
      duration: const Duration(seconds: 04),
    )..repeat();

    checkAuthState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const rippleColor = Color.fromARGB(255, 125, 240, 184);

    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            final value = _controller.value;

            return SizedBox(
              width: 200,
              height: 200,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  RippleEffectContainer(
                    radius: 200 * value,
                    color: rippleColor,
                    opacity: 1 - value,
                  ),
                  RippleEffectContainer(
                    radius: 150 * value,
                    color: rippleColor.withValues(alpha: 0.7),
                    opacity: 1 - value,
                  ),
                  RippleEffectContainer(
                    radius: 100 * value,
                    color: rippleColor.withValues(alpha: 0.5),
                    opacity: 1 - value,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      AssetString.appIcon,
                      height: 80,
                      width: 80,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void checkAuthState() async {
    await Future.delayed(const Duration(seconds: 2));

    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.pushReplacementNamed(context, RouteName.home);
    } else {
      Navigator.pushReplacementNamed(context, RouteName.splash);
    }
  }
}
