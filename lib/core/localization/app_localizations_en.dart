// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get signin => 'Ulgama girmek';

  @override
  String get signup => 'Ulgama agza bolmak';

  @override
  String get signout => 'Ulgamdan çykmak';

  @override
  String get singtap => 'Giriş';

  @override
  String get welcomeText =>
      'Siziň bilen hyzmatdaşlyk etmek bize şatlyk berýär. Geliň, söwdaňyzy aňsat we ýakymly edeliň!';

  @override
  String get phoneNumber => 'Telefon belgi';

  @override
  String get password => 'Açar sözi';

  @override
  String get forgotPassword => 'Açar sözüni unutdyňyzmy?';

  @override
  String get dontHaveAccount => 'Siziň sahypaňyz ýokmy? ';

  @override
  String get haveAccount => 'Siziň sahypaňyz barmy? ';

  @override
  String get time => 'Wagt';
}
