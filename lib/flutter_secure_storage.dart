import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = FlutterSecureStorage();

Future<void> storeToken(String token) async {
  print('Storing token: $token');
  print('Storing token: $token');
  await storage.write(key: 'authToken', value: token);
  print('Token stored and verified: $token');
}

Future<String?> getToken() async {
  final token = await storage.read(key: 'authToken');
  print('Retrieved token: $token'); // Debug statement
  return token;
}

Future<void> clearStorage() async {
  await storage.deleteAll();
  print('Storage cleared'); // Debug statement
}
