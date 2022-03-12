import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  FlutterSecureStorage? storage;
  SecureStorageHelper._internal() {
    storage = const FlutterSecureStorage();
  }
  static final SecureStorageHelper _instance = SecureStorageHelper._internal();
  factory SecureStorageHelper() => _instance;

  Future<void> storeToken(String accessToken, refreshToken) async{
    await storage!.write(key: 'accessToken', value: accessToken);
    await storage!.write(key: 'refreshToken', value: refreshToken);
  }
  Future<String?> getUserToken() async {
    String? value = await storage!.read(key: "refreshToken");
    return value;
  }
}