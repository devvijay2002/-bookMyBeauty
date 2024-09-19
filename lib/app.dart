import 'package:bookmybeauty/app_binding/app_binding.dart';
import 'package:bookmybeauty/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BookMyBeauty',
      initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
       theme: ThemeData(
         appBarTheme: const AppBarTheme(
             systemOverlayStyle: SystemUiOverlayStyle(
               statusBarColor: Colors.transparent, // Status bar color
               statusBarIconBrightness: Brightness.light, // Status bar icon brightness
             )),
        fontFamily: GoogleFonts.nunito().fontFamily,
        dividerColor: Colors.transparent,

      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.onGenerateRoute,
    );
  }
}
