import 'package:flutter/material.dart';
import 'package:sapa_mata/core/constants/color_constants.dart';
import 'package:sapa_mata/core/theme/app_typography.dart';

class AppTheme {
  static ThemeData light(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: ColorConstants.primaryWhite,
      scaffoldBackgroundColor: ColorConstants.primaryWhite,
      cardColor: ColorConstants.primaryWhite,
      dividerColor: ColorConstants.primaryGrey,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorConstants.primaryWhite,
        foregroundColor: ColorConstants.primaryBlack,
        elevation: 0,
      ),
      textTheme: TextTheme(
        headlineLarge: AppTypography.headlineLarge(context),
        titleLarge: AppTypography.titleLarge(context),
        bodyLarge: AppTypography.bodyLarge(context),
        bodyMedium: AppTypography.bodyMedium(context),
        labelSmall: AppTypography.labelSmall(context),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstants.primaryGreen,
          foregroundColor: ColorConstants.primaryWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  static ThemeData dark(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: ColorConstants.primaryBlack,
      scaffoldBackgroundColor: ColorConstants.primaryBlack,
      cardColor: ColorConstants.primaryBlack,
      dividerColor: ColorConstants.primaryGrey,
      textTheme: TextTheme(
        headlineLarge: AppTypography.headlineLarge(context),
        titleLarge: AppTypography.titleLarge(context),
        bodyLarge: AppTypography.bodyLarge(context),
        bodyMedium: AppTypography.bodyMedium(context),
        labelSmall: AppTypography.labelSmall(context),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstants.primaryGreen,
          foregroundColor: ColorConstants.primaryBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
