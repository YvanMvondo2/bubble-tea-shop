import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_routes.dart';
import 'configuration.dart';
import 'controller/master_controller.dart';

import 'layout/letter_spacing.dart';
import 'momo/colors.dart';
part 'init.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependency(true);
  runApp(const RootRestorationScope(restorationId: 'root',
  child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

    @override
  void dispose() {
    disposeDependency();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      restorationScopeId: 'momo_app',
      title: 'MoMo Go',
      debugShowCheckedModeBanner: false,
      theme: _buildRallyTheme(),
      routerConfig: AppRoutes.instance.getRouter(
          parentKey: GlobalKey<NavigatorState>(),
          shellKey: GlobalKey<NavigatorState>()),
    );
  }

  ThemeData _buildRallyTheme() {
    final base = ThemeData.dark();
    return ThemeData(
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: MomoColors.primaryBackground,
        elevation: 0,
      ),
      scaffoldBackgroundColor: MomoColors.white,
      // focusColor: MomoColors.focusColor,
      textTheme: _buildRallyTextTheme(base.textTheme),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(
          color: MomoColors.black,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: MomoColors.inputBackground,
        focusedBorder: InputBorder.none,
      ),
      visualDensity: VisualDensity.comfortable,
      colorScheme: base.colorScheme.copyWith(
        primary: MomoColors.primaryBackground,
      ),
    );
  }

  TextTheme _buildRallyTextTheme(TextTheme base) {
    return base
        .copyWith(
          bodyMedium: GoogleFonts.robotoCondensed(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: letterSpacingOrNone(0.5),
          ),
          bodyLarge: GoogleFonts.eczar(
            fontSize: 40,
            fontWeight: FontWeight.w400,
            letterSpacing: letterSpacingOrNone(1.4),
          ),
          labelLarge: GoogleFonts.robotoCondensed(
            fontWeight: FontWeight.w700,
            letterSpacing: letterSpacingOrNone(2.8),
          ),
          headlineSmall: GoogleFonts.eczar(
            fontSize: 40,
            fontWeight: FontWeight.w600,
            letterSpacing: letterSpacingOrNone(1.4),
          ),
        )
        .apply(
          displayColor: Colors.black,
          bodyColor: Colors.black,
        );
  }
}
