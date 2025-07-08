import 'package:direct_drive/config/route_name.dart';
import 'package:direct_drive/src/feature/appbar_bottom_bar/bottom_navigation_bar.dart';

import 'package:direct_drive/src/feature/auth/screen/resgester_account/email_otp_screen.dart';
import 'package:direct_drive/src/feature/auth/screen/resgester_account/name_enter_screen.dart';

import 'package:direct_drive/src/feature/auth/screen/resgester_account/password_screen.dart';
import 'package:direct_drive/src/feature/auth/screen/sigin/forget_password.dart';
import 'package:direct_drive/src/feature/auth/screen/sigin/signIn_screen.dart';
import 'package:direct_drive/src/feature/auth/screen/sinup_screen.dart';
import 'package:direct_drive/src/feature/home/screen/home_screen.dart';
import 'package:direct_drive/src/feature/splash/screen/animationscree.dart';
import 'package:direct_drive/src/feature/splash/screen/splash_screen.dart';
import 'package:flutter/material.dart';

mixin AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SplashScreen(),
        );

          case RouteName.animation:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const Animationscree(),
        );

              case RouteName.appbottm:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const AppbarBottombar(),
        );
      case RouteName.signIn:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SigninScreen(),
        );
      case RouteName.signUp:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SignupScreen(),
        );

      case RouteName.emailOtp:
        return MaterialPageRoute(builder: (_) => const EmailOtpScreen());
      case RouteName.name:
        return MaterialPageRoute(builder: (_) => const NameScreen());
      case RouteName.password:
        return MaterialPageRoute(builder: (_) => const PasswordScreen());
      case RouteName.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RouteName.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
