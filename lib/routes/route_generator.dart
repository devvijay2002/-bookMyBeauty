import 'dart:developer';
import 'dart:io';
import 'package:bookmybeauty/routes/routes.dart';
import 'package:bookmybeauty/screens/login_screen/view/forgot_password_module/reset_password_view.dart';
import 'package:bookmybeauty/screens/login_screen/view/forgot_password_module/verify_otp_view.dart';
import 'package:bookmybeauty/screens/login_screen/view/forgot_password_module/send_otp_view.dart';
import 'package:flutter/cupertino.dart';
import '../screens/guide_screens/view/guide_view.dart';
import '../screens/login_screen/view/login_view/login_view.dart';
import '../screens/splash_screen/view/splash_view.dart';
import '../shared/fade_route_transition.dart';


class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    Map<String, dynamic> arguments = <String, dynamic>{};

    if (settings.arguments != null) {
      arguments = settings.arguments as Map<String, dynamic>;
    }

    log(settings.name ?? "Null Route Name");

    ///Helper to navigate from router
    navigateToScreen({required RouteSettings settings, required Widget route}) {
      if (Platform.isIOS) {
        return CupertinoPageRoute(builder: (_) => route);
      }
      return FadeRoute(settings: settings, route: route);
    }

    switch (settings.name) {
      case "/":
        return navigateToScreen(
          settings: settings,
          route:  const SplashView(),
        );
        case Routes.guideTourScreen:
        return navigateToScreen(
          settings: settings,
          route: GuideTourScreen(),
        );
        case Routes.loginPageRoute:
        return navigateToScreen(
          settings: settings,
          route: const LoginView(),
        );
        case Routes.sendOtpRoute:
        return navigateToScreen(
          settings: settings,
          route: const SendOtpView(),
        );
        case Routes.verifyOtpRoute:
        return navigateToScreen(
          settings: settings,
          route: const VerifyOtpView(),
        );
        case Routes.resetPasswordRoute:
        return navigateToScreen(
          settings: settings,
          route: const ResetPasswordView(),
        );
        default:
        return FadeRoute(
          settings: settings,
          route: const SplashView(),
        );
    }
  }
}
