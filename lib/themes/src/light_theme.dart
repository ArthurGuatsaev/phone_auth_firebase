part of '../theme.dart';

ThemeData createLightTheme() {
  return ThemeData(
    textTheme: createTextTheme(),
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    extensions: <ThemeExtension<dynamic>>[
      ThemeColors.light,
      ThemeText.light,
    ],
    primaryColor: AppColors.primary,
    focusColor: Colors.blue.withOpacity(0.2),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
  );
}
