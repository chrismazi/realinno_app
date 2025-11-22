import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Supabase Auth service wrapping Supabase client auth methods
class SupabaseAuthService {
  final SupabaseClient _client = Supabase.instance.client;

  /// Sign up with email/password and optional metadata
  Future<AuthResponse> signUp({
    required String email,
    required String password,
    String? displayName,
    String? phone,
    Map<String, dynamic>? additionalMetadata,
  }) async {
    final response = await _client.auth.signUp(
      email: email,
      password: password,
      data: {
        if (displayName != null) 'display_name': displayName,
        if (phone != null) 'phone': phone,
        ...?additionalMetadata,
      },
    );
    return response;
  }

  /// Sign in with email/password
  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    final response = await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return response;
  }

  /// Sign out current session
  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  /// Current authenticated user
  User? get currentUser => _client.auth.currentUser;

  /// Auth state changes stream
  Stream<AuthState> get authStateChanges => _client.auth.onAuthStateChange;

  /// Update user metadata (e.g., display name)
  Future<UserResponse> updateMetadata(Map<String, dynamic> metadata) async {
    return await _client.auth.updateUser(
      UserAttributes(data: metadata),
    );
  }

  /// Reset password
  Future<void> resetPassword(String email) async {
    await _client.auth.resetPasswordForEmail(email);
  }
}

/// Provider for SupabaseAuthService
final supabaseAuthProvider = Provider<SupabaseAuthService>((ref) {
  return SupabaseAuthService();
});

/// Provider for current user (reactive)
final currentUserProvider = StreamProvider<User?>((ref) {
  return ref.watch(supabaseAuthProvider).authStateChanges.map((state) => state.session?.user);
});
