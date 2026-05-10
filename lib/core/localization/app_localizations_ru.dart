// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get signin => 'Войти';

  @override
  String get signup => 'Зарегистрироваться';

  @override
  String get signout => 'Выйти';

  @override
  String get singtap => 'Войти';

  @override
  String get welcomeText =>
      'Сотрудничать с вами для нас — радость. Давайте сделаем ваши покупки удобными и приятными!';

  @override
  String get phoneNumber => 'Номер телефона';

  @override
  String get password => 'Пароль';

  @override
  String get forgotPassword => 'Забыли пароль?';

  @override
  String get dontHaveAccount => 'У вас нет аккаунта? ';

  @override
  String get haveAccount => 'У вас есть аккаунт? ';

  @override
  String get time => 'Время';
}
