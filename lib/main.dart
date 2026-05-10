// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sapa_mata/core/localization/app_localizations.dart';
import 'package:sapa_mata/core/theme/app_theme.dart';
import 'package:sapa_mata/features/auth_page/presentation/sign_up_page.dart';
// import 'package:sapa_mata/core/theme/app_typography.dart';
// import 'package:sapa_mata/core/utils/context_ext.dart';
// import 'package:sapa_mata/core/utils/context_extensions.dart';
import 'package:sapa_mata/features/auth_page/presentation/sing_in_page.dart';
// import 'package:sapa_mata/features/auth_page/presentation/sing_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  ThemeMode _themeMode = ThemeMode.system;

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  void setThemeMode(ThemeMode mode) => setState(() => _themeMode = mode);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: _locale,
      themeMode: _themeMode,
      theme: AppTheme.light(context),
      darkTheme: AppTheme.dark(context),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const SignUpPage(),
    );
  }
}

// class TestScreen extends StatelessWidget {
//   const TestScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(context.languageLoc.helloWorld),
//         titleTextStyle: context.headline,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Current Language Display
//             Text("Current: ${Localizations.localeOf(context).languageCode}"),

//             Text('Salam hemma', style: context.headline),
//             Text('Salam hemma', style: context.titleLarge),
//             Text('Salam hemma', style: context.bodyLarge),
//             Text('Salam hemma', style: context.bodyMedium),
//             Text('Salam hemma', style: context.labelSmall),

//             const SizedBox(height: 20),

//             // Button to Switch to Russian
//             ElevatedButton(
//               onPressed: () {
//                 MyApp.of(context)?.setLocale(const Locale('ru'));
//               },
//               child: const Text("Switch to Russian (RU)"),
//             ),

//             // Button to Switch to English
//             ElevatedButton(
//               onPressed: () {
//                 MyApp.of(context)?.setLocale(const Locale('en'));
//               },
//               child: const Text("Switch to English (EN)"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Switch to Dark
//                 MyApp.of(context)?.setThemeMode(ThemeMode.dark);
//               },
//               child: const Text("Dark Mode"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Switch to Light
//                 MyApp.of(context)?.setThemeMode(ThemeMode.light);
//               },
//               child: const Text("Light Mode"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
