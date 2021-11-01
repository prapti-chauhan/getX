import 'package:get_storage/get_storage.dart';

class AppPref {
  final box = GetStorage();

  static final AppPref _instance = AppPref._internal();

  factory AppPref() => _instance;

  AppPref._internal();

  set email(String value) => box.write('email', value);

  String get email => box.read('email') ?? '';

  String get userId => box.read('userId') ?? '';

  set userId(String value) => box.write('userId', value);

  set seen(bool value) => box.write('seen', value);

  bool get seen => box.read('seen') ?? false;

  logout() {
    box.remove(email);
  }
}
