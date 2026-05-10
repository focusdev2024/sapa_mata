import 'package:flutter/material.dart';
import '../theme/app_typography.dart';

extension TypographyExtension on BuildContext {
  // TextStyle get displayLarge => AppTypography.displayLarge(this);
  TextStyle get headline => AppTypography.headlineLarge(this);
  TextStyle get titleLarge => AppTypography.titleLarge(this);
  TextStyle get bodyLarge => AppTypography.bodyLarge(this);
  TextStyle get bodyMedium => AppTypography.bodyMedium(this);
  TextStyle get labelSmall => AppTypography.labelSmall(this);
}
