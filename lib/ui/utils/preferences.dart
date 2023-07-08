import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

class LoginMechanism {
  static const String email = 'EMAIL';
  static const String fingerprint = 'FINGERPRINT';
  static const String face = 'FACE';
  static const String pin = 'PIN';
}

class Preference {
  static const String isFirstRun = 'isFirstRun';
  static const String isLangAR = 'LOGIN_MECHANISM';
  static const String isLogin = 'ONBOARDING_COMPLETE';
  static const String phoneNumber = 'PHONE_NUMBER';

  // One-time question: user asked if they want to use a PIN for authentication
  static const String loginMechanismPinAsk = 'LOGIN_MECHANISM_PIN_ASK';

  // Flag indicating if fingerprint authentication is supported
  static const String credentialsFingerprintAvailable =
      'CREDENTIALS_FINGERPRINT_AVAILABLE';

  static const String credentialsFaceAvailable = 'CREDENTIALS_FACE_AVAILABLE';

  static const String firstName = 'USERS_FIRST_NAME';

  static const String isWelcomeScreenSeen = 'IS_WELCOME_SCREEN_SEEN';

  static const String invalidPinCount = 'INVALID_PIN_COUNT';

  static const String pin = 'PIN';

  static const String accessToken = 'ACCESS_TOKEN';
  static const String buyerId = 'BUYER_ID';
  // static const String buyerId = 'BUYER_ID';

  static const String refreshToken = 'REFRESH_TOKEN';

  static const String userID = 'USER_ID';

  static const String userData = 'USER_DATA';
  static const String userFirebaseID = 'userFirebaseID';
  static const String userFullName = 'USER_FULL_NAME';
  static const String createdAt = 'CREATED_AT';
  static const String upadatedAt = 'UPDATED_AT';
  static const String userEmail = 'USER_EMAIL';
  static const String userStatus = 'USER_STATUS';
  static const String userPhone = 'USER_PHONE';
  static const String userQatarId = 'USER_QATAR_ID';
}

@injectable
class Preferences {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static final Preferences _singleton = Preferences._internal();
  factory Preferences() {
    return _singleton;
  }

  Preferences._internal();

  Future saveString(String name, String? value) async {
    await _secureStorage.write(key: name.toLowerCase(), value: value);
  }

  Future saveModel(String name, Object value) async {
    await _secureStorage.write(
        key: name.toLowerCase(), value: value.toString());
  }

  Future userData(String name, String value) async {
    await _secureStorage.write(key: name.toLowerCase(), value: value);
  }

  Future saveBool(String name, bool value) async {
    await _secureStorage.write(
        key: name.toLowerCase(), value: value.toString());
  }

  Future saveLOGOUT() async {
    await _secureStorage.deleteAll();
  }

  Future<String?> getString(String name) async {
    return await _secureStorage.read(key: name.toLowerCase());
  }

  Future<bool> getBool(String name) async {
    final value = await _secureStorage.read(key: name.toLowerCase());
    return value == 'true';
  }

  Future<int> getInt(String name) async {
    final value = await _secureStorage.read(key: name.toLowerCase());
    var intValue = value ?? '0';
    return int.parse(intValue);
  }

  Future saveInt(String name, int value) async {
    await _secureStorage.write(
        key: name.toLowerCase(), value: value.toString());
  }

  Future remove(String name) async {
    await _secureStorage.delete(key: name.toLowerCase());
  }

  Future removeAll() async {
    await _secureStorage.deleteAll();
  }
}
