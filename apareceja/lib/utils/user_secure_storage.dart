import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static final _storage = FlutterSecureStorage();

  static const _keyName = 'firstName';

  static const _keyLastName = 'lastName';

  static const _keyUser = 'userSignedIn';

  static const _keyToken = 'token';

  static const _keyCPF = 'cpf';

  static Future setName(String name) async =>
      await _storage.write(key: _keyName, value: name);

  static Future<String?> getName() async => await _storage.read(key: _keyName);

  static Future setLastName(String lastName) async =>
      await _storage.write(key: _keyLastName, value: lastName);

  static Future<String?> getLastName() async =>
      await _storage.read(key: _keyLastName);

  static Future setCPF(String cpf) async =>
      await _storage.write(key: _keyCPF, value: cpf);

  static Future<String?> getCPF() async => await _storage.read(key: _keyCPF);

  static Future setToken(String token) async =>
      await _storage.write(key: _keyToken, value: token);

  static Future getToken() async => await _storage.read(key: _keyToken);
}
