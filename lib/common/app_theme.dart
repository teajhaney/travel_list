import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

class AppTheme {
  AppTheme._();
  static ThemeData light = FlexThemeData.light(
    scheme: FlexScheme.indigo,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    // )
    // .copyWith(
    //   textTheme: GoogleFonts.urbanistTextTheme(
    //     ThemeData.light().textTheme,
    //   ),
    //   primaryTextTheme: GoogleFonts.urbanistTextTheme(
    //     ThemeData.light().primaryTextTheme,
    //   ),
  );
  static ThemeData dark = FlexThemeData.dark(
    scheme: FlexScheme.indigo,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    // ).copyWith(
    //   // scaffoldBackgroundColor: const Color.fromARGB(255, 8, 9, 12),
    //   // appBarTheme: const AppBarTheme().copyWith(
    //   //   backgroundColor: Colors.transparent,
    //   //   // iconTheme: const IconThemeData(opacity: 1),
    //   //   // titleTextStyle: const TextStyle(color: Colors.white, fontSize: 25)
    //   // ),
    //   textTheme: GoogleFonts.urbanistTextTheme(
    //     ThemeData.dark().textTheme,
    //   ),
    //   primaryTextTheme: GoogleFonts.urbanistTextTheme(
    //     ThemeData.dark().primaryTextTheme,
    //   ),
  );
}
