import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'supabase_auth_service.dart';

/// Profile model stored in Supabase
class UserProfile {
  final String id;
  final String userId;
  final String displayName;
  final String? phone;
  final String? gender;
  final String? ageGroup;
  final String? occupation;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserProfile({
    required this.id,
    required this.userId,
    required this.displayName,
    this.phone,
    this.gender,
    this.ageGroup,
    this.occupation,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      id: map['id'] as String,
      userId: map['user_id'] as String,
      displayName: map['display_name'] as String,
      phone: map['phone'] as String?,
      gender: map['gender'] as String?,
      ageGroup: map['age_group'] as String?,
      occupation: map['occupation'] as String?,
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: DateTime.parse(map['updated_at'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'display_name': displayName,
      'phone': phone,
      'gender': gender,
      'age_group': ageGroup,
      'occupation': occupation,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

/// Service to interact with user_profiles table
class SupabaseProfileService {
  final SupabaseClient _client = Supabase.instance.client;

  /// Upsert user profile (create if not exists)
  Future<UserProfile> upsertProfile({
    required String userId,
    required String displayName,
    String? phone,
    String? gender,
    String? ageGroup,
    String? occupation,
  }) async {
    final data = {
      'user_id': userId,
      'display_name': displayName,
      'phone': phone,
      'gender': gender,
      'age_group': ageGroup,
      'occupation': occupation,
    };

    final response = await _client
        .from('user_profiles')
        .upsert(data)
        .select()
        .single();

    return UserProfile.fromMap(response);
  }

  /// Get profile by user ID
  Future<UserProfile?> getProfile(String userId) async {
    final response = await _client
        .from('user_profiles')
        .select()
        .eq('user_id', userId)
        .maybeSingle();

    return response != null ? UserProfile.fromMap(response) : null;
  }

  /// Stream profile changes for a user
  Stream<UserProfile?> watchProfile(String userId) {
    return _client
        .from('user_profiles')
        .stream(primaryKey: ['user_id'])
        .eq('user_id', userId)
        .map((event) {
          final row = event.firstOrNull;
          return row != null ? UserProfile.fromMap(row) : null;
        });
  }

  /// Update profile fields
  Future<UserProfile> updateProfile({
    required String userId,
    String? displayName,
    String? phone,
    String? gender,
    String? ageGroup,
    String? occupation,
  }) async {
    final updates = <String, dynamic>{};
    if (displayName != null) updates['display_name'] = displayName;
    if (phone != null) updates['phone'] = phone;
    if (gender != null) updates['gender'] = gender;
    if (ageGroup != null) updates['age_group'] = ageGroup;
    if (occupation != null) updates['occupation'] = occupation;

    final response = await _client
        .from('user_profiles')
        .update(updates)
        .eq('user_id', userId)
        .select()
        .single();

    return UserProfile.fromMap(response);
  }
}

/// Provider for SupabaseProfileService
final supabaseProfileProvider = Provider<SupabaseProfileService>((ref) {
  return SupabaseProfileService();
});

/// Provider for current user's profile (reactive)
final currentUserProfileProvider = StreamProvider<UserProfile?>((ref) {
  final auth = ref.watch(supabaseAuthProvider);
  final user = auth.currentUser;
  if (user == null) return Stream.value(null);
  return ref.watch(supabaseProfileProvider).watchProfile(user.id);
});
