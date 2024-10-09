import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {

  static Future<void> writeToLocalStorage({required String key,required String value})async{
    const storage = FlutterSecureStorage();
    await storage.write(key: key, value: value);
  }

  static Future<String?> readFromLocalStorage({required String key})async{
    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: key);
    return value;
  }


}