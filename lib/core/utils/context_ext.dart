import 'package:flutter/material.dart';
import 'package:sapa_mata/core/localization/app_localizations.dart';

extension LocalizedContext on BuildContext {
  // Shortcut to access the localizations object
  AppLocalizations get languageLoc => AppLocalizations.of(this)!;
}
