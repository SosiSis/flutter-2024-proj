import 'package:flutter_project/providers/authnotifier.dart';
import 'package:flutter_project/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for the authentication repository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository("http://localhost:3003");
});

// Provider for the authentication state
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return AuthNotifier(repository);
});
