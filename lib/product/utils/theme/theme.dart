import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tutorial_app/product/utils/theme/color_schemes.g.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: GoogleFonts.ubuntu().fontFamily,
  useMaterial3: true,
  colorScheme: lightColorScheme,
);
ThemeData darkTheme = ThemeData(
  fontFamily: GoogleFonts.ubuntu().fontFamily,
  useMaterial3: true,
  colorScheme: darkColorScheme,
);

extension type const ChooseThemeMode(String themeMode) {
  ThemeMode get getThemeMode => switch (themeMode) {
        'light' => ThemeMode.light,
        'dark' => ThemeMode.dark,
        _ => ThemeMode.system,
      };
}
