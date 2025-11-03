import React from 'react';
import { View, Text, StyleSheet, ScrollView, TouchableOpacity } from 'react-native';
import { colors, spacing, typography } from '../../theme/theme';
import { useAuth } from '../../context/AuthContext';

const ProfileScreen = () => {
  const { logout } = useAuth();

  return (
    <ScrollView style={styles.container}>
      <View style={styles.header}>
        <Text style={styles.title}>Profile</Text>
      </View>
      
      <View style={styles.content}>
        <View style={styles.profileCard}>
          <Text style={styles.profileIcon}>👤</Text>
          <Text style={styles.profileName}>Real Works User</Text>
          <Text style={styles.profilePhone}>+250 XXX XXX XXX</Text>
        </View>

        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Settings</Text>
          
          <TouchableOpacity style={styles.menuItem}>
            <Text style={styles.menuText}>Language / Ururimi</Text>
          </TouchableOpacity>

          <TouchableOpacity style={styles.menuItem}>
            <Text style={styles.menuText}>Notifications</Text>
          </TouchableOpacity>

          <TouchableOpacity style={styles.menuItem}>
            <Text style={styles.menuText}>Privacy & Security</Text>
          </TouchableOpacity>

          <TouchableOpacity style={styles.menuItem}>
            <Text style={styles.menuText}>Help & Support</Text>
          </TouchableOpacity>
        </View>

        <TouchableOpacity style={styles.logoutButton} onPress={logout}>
          <Text style={styles.logoutText}>Logout</Text>
        </TouchableOpacity>
      </View>
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  header: {
    backgroundColor: colors.primary,
    padding: spacing.lg,
    paddingTop: spacing.xxl,
  },
  title: {
    fontSize: typography.fontSize.xxl,
    fontWeight: 'bold',
    color: colors.white,
  },
  content: {
    padding: spacing.md,
  },
  profileCard: {
    backgroundColor: colors.white,
    padding: spacing.xl,
    borderRadius: 12,
    alignItems: 'center',
    marginBottom: spacing.lg,
  },
  profileIcon: {
    fontSize: 60,
    marginBottom: spacing.md,
  },
  profileName: {
    fontSize: typography.fontSize.xl,
    fontWeight: 'bold',
    color: colors.text,
    marginBottom: spacing.xs,
  },
  profilePhone: {
    fontSize: typography.fontSize.md,
    color: colors.textSecondary,
  },
  section: {
    backgroundColor: colors.white,
    borderRadius: 12,
    padding: spacing.xs,
    marginBottom: spacing.lg,
  },
  sectionTitle: {
    fontSize: typography.fontSize.lg,
    fontWeight: 'bold',
    color: colors.text,
    padding: spacing.md,
  },
  menuItem: {
    padding: spacing.md,
    borderBottomWidth: 1,
    borderBottomColor: colors.gray200,
  },
  menuText: {
    fontSize: typography.fontSize.md,
    color: colors.text,
  },
  logoutButton: {
    backgroundColor: colors.error,
    padding: spacing.md,
    borderRadius: 12,
    alignItems: 'center',
  },
  logoutText: {
    fontSize: typography.fontSize.lg,
    fontWeight: '600',
    color: colors.white,
  },
});

export default ProfileScreen;
