import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sapa_mata/core/constants/color_constants.dart';

class AppTypography {
  static bool _isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > 600;

  static double _s(BuildContext context, double mobile, double tablet) =>
      _isTablet(context) ? tablet : mobile;

  // static TextStyle displayLarge(BuildContext context) => GoogleFonts.montserrat(
  //   fontSize: _s(context, 57, 64),
  //   fontWeight: FontWeight.bold,
  // );

  // Big addvertisement text
  static TextStyle headlineLarge(BuildContext context) =>
      GoogleFonts.montserrat(
        fontSize: _s(context, 32, 36),
        fontWeight: FontWeight.bold,
        color: ColorConstants.primaryGreen,
      );

  // Hello text
  static TextStyle titleLarge(BuildContext context) => GoogleFonts.montserrat(
    fontSize: _s(context, 22, 24),
    fontWeight: FontWeight.w600,
  );

  // Regular text
  static TextStyle bodyLarge(BuildContext context) => GoogleFonts.montserrat(
    fontSize: _s(context, 16, 18),
    fontWeight: FontWeight.normal,
  );

  // Small text
  static TextStyle bodyMedium(BuildContext context) => GoogleFonts.montserrat(
    fontSize: _s(context, 14, 16),
    fontWeight: FontWeight.normal,
  );

  // Mark text
  static TextStyle labelSmall(BuildContext context) => GoogleFonts.montserrat(
    fontSize: _s(context, 11, 12),
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );
}
