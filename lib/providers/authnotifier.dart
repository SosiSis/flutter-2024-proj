import 'package:flutter_project/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

// Secure Storage setup
final storage = FlutterSecureStorage();

Future<void> storeToken(String token) async {
  print('Storing token: $token');
  await storage.write(key: 'authToken', value: token);
}

Future<void> storeUserId(String userId) async {
  print('Storing userId: $userId');
  await storage.write(key: 'userId', value: userId);
}

Future<String?> getToken() async {
  final token = await storage.read(key: 'authToken');
  print('Retrieved token: $token'); // Debug statement
  return token;
}

Future<String?> getUserId() async {
  final userId = await storage.read(key: 'userId');
  print('Retrieved userId: $userId'); // Debug statement
  return userId;
}

Future<void> clearStorage() async {
  await storage.deleteAll();
  print('Storage cleared'); // Debug statement
}

class AuthState {
  final bool isAuthenticated;
  final String? token;
  final String? userId;

  AuthState({this.isAuthenticated = false, this.token, this.userId});
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;

  AuthNotifier(this._authRepository) : super(AuthState());

  Future<void> signUp(String fullName, String email, String password) async {
    try {
      final token = await _authRepository.signup(fullName, email, password);
      print('Token received after signup: $token');
      await storeToken(token);

      // Decode the token to extract the user ID
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      String userId = decodedToken['id'];
      await storeUserId(userId);

      state = AuthState(isAuthenticated: true, token: token, userId: userId);
    } catch (e) {
      print('Exception during signup: $e'); // Debug statement
      state = AuthState(isAuthenticated: false);
    }
  }

  Future<void> login(String email, String password) async {
    try {
      final data = await _authRepository.login(email, password);
      final token = data['token'];
      print('Token received after login: $token');
      await storeToken(token);

      // Decode the token to extract the user ID
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      String userId = decodedToken['id'];
      await storeUserId(userId);

      state = AuthState(isAuthenticated: true, token: token, userId: userId);
    } catch (e) {
      print('Exception during login: $e'); // Debug statement
      state = AuthState(isAuthenticated: false);
    }
  }

  Future<Map<String, dynamic>> fetchUserDetails() async {
    try {
      final token = await getToken();
      print('Token used to fetch user details: $token'); // Debug statement
      if (token != null) {
        return await _authRepository.fetchUserDetails(token);
      } else {
        throw Exception('Token not found');
      }
    } catch (e) {
      print('Exception during fetching user details: $e'); // Debug statement
      throw e;
    }
  }

  Future<void> updateUserDetails(String name, String email, String password) async {
    try {
      final token = await getToken();
      final userId = await getUserId();
      if (token != null && userId != null) {
        await _authRepository.updateUserDetails(token, userId, name, email, password);
        state = AuthState(isAuthenticated: true, token: token, userId: userId);
      } else {
        throw Exception('Token or userId not found');
      }
    } catch (e) {
      print('Exception during updating user details: $e');
      throw e;
    }
  }

  Future<void> logout() async {
    await clearStorage();
    state = AuthState(isAuthenticated: false);
  }
}
