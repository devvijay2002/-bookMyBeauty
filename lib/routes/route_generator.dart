import 'dart:developer';
import 'dart:io';
import 'package:bookmybeauty/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import '../screens/about_us/view/about_us.dart';
import '../screens/add_to_cart/view/add_to_cart.dart';
import '../screens/appointment/view/appointment.dart';
import '../screens/blog_details/view/blog_details.dart';
import '../screens/checkout/view/checkout.dart';
import '../screens/enable_geo_location_1_screen/view/enalble_geo_location_1.dart';
import '../screens/enable_geo_location_screen/view/enable_geo_location.dart';
import '../screens/guide_screens/view/guide_view.dart';
import '../screens/login_screen/view/login_view.dart';
import '../screens/no_internet_screen/view/no_internet.dart';
import '../screens/our_blogs/view/our_blogs.dart';
import '../screens/splash_screen/view/splash_view.dart';
import '../screens/thanks_screen/view/thanks.dart';
import '../screens/thanks_screen/view/thanks.dart';
import '../screens/thanks_screen/view/thanks.dart';
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

      // case "/":
      //   return navigateToScreen(
      //     settings: settings,
      //     route:   OurBlogsRoutes(),
      //   );

        case Routes.aboutUsRoute:
        return navigateToScreen(
          settings: settings,
          route:   aboutUsRoute(),
        );
        case Routes.blogDetailsRoute:
        return navigateToScreen(
          settings: settings,
          route:   blogDetailsRoute(),
        );
      case Routes.appointmentRoute:
        return navigateToScreen(
          settings: settings,
          route:   appointmentRoute(),
        );
      case Routes.checkout:
        return navigateToScreen(
          settings: settings,
          route:   checkout(),
        );
      case Routes.addToCart:
        return navigateToScreen(
          settings: settings,
          route:   addToCart(),
        );
        case Routes.enableGeoLocation1:
        return navigateToScreen(
          settings: settings,
          route:   enableGeoLocation1(),
        );
      case Routes.noInternet:
        return navigateToScreen(
          settings: settings,
          route:   noInternet(),
        );
      case Routes.enableGeoLocation:
        return navigateToScreen(
          settings: settings,
          route:   enableGeoLocation(),
        );
      case Routes.thanksPageRoute:
        return navigateToScreen(
          settings: settings,
          route:   ThanksView(),
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
        default:
        return FadeRoute(
          settings: settings,
          route: const SplashView(),
        );
    }
  }
}
