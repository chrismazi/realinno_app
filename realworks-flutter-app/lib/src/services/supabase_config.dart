import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const String supabaseUrl = 'https://novfgokvyfpjfikuhkhz.supabase.co';
  static const String supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5vdmZnb2t2eWZwamZpa3Voa2h6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM3MjA5NjcsImV4cCI6MjA3OTI5Njk2N30.Gvj8TP4QfUHLv77-ZN8Nory_cLb_mLM5zHGO7RLJy6s';

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );
  }
}
