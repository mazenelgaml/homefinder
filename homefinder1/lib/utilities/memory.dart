import 'dart:ui';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageKeys {
  StorageKeys();
  static const String activeLocale = "ACTIVE_LOCAL";
  static const String userId = "User_Id";
  static const String userToken = "User_Token";
  static const String userName = "User_Name";

}

class StorageService extends GetxService {
  StorageService(this._prefs);

  final SharedPreferences _prefs;

  static Future<StorageService> init() async {
    // await GetStorage.init();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return StorageService(prefs);
  }

  //to save id of the account
  Future<void> saveAccountId(String userId) async =>
      _prefs.setString(StorageKeys.userId, userId);
  Future<void> saveAccountToken(String userToken) async =>
      _prefs.setString(StorageKeys.userToken, userToken);
  Future<void> saveAccountName(String userName) async =>
      _prefs.setString(StorageKeys.userName, userName);

  String get getId {
    return _prefs.getString(StorageKeys.userId)?? "0";
  }
  String get getToken {
    return _prefs.getString(StorageKeys.userToken)?? "0";
  }
  String get userName {
    return _prefs.getString(StorageKeys.userName)?? " ";
  }
  loggingOut(){
    _prefs.remove(StorageKeys.userId);
  }
  //
  // to check if user record dismissal or not
  bool get checkUserIsSignedIn  {
    return _prefs.containsKey(StorageKeys.userId);
  }


  //Active Locale

  set activeLocale(Locale activeLocal) {
    _prefs.setString(StorageKeys.activeLocale, activeLocal.toString());
  }
}