// import 'package:shared_preferences/shared_preferences.dart';

// class StorageUtil {
//   static late StorageUtil _storageUtil;
//   static late SharedPreferences _preferences;

//   static Future<StorageUtil> getInstance() async {
//     if (_storageUtil == null) {
//       var secureStorage = StorageUtil._();
//       await secureStorage._init();
//       _storageUtil = secureStorage;
//     }
//     return _storageUtil;
//   }
//   StorageUtil._();
//   Future _init() async {
//     _preferences = await SharedPreferences.getInstance();
//   }
//   // get string
//   static String getString(String key, {String defValue = ''}) {
//     if (_preferences == null) return defValue;
//     return _preferences.getString(key) ?? defValue;
//   }
//   // put string
//   static Future<bool> putString(String key, String value) {
//     if (_preferences == null) return null;
//     return _preferences.setString(key, value);
//   }

// }