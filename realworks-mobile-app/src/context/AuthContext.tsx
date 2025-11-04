import React, { createContext, useContext, useState, useEffect, ReactNode } from 'react';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { authService } from '../services/authService';

interface User {
  id: string;
  phoneNumber: string;
  language: 'en' | 'rw';
  goals: string[];
  createdAt: string;
}

interface AuthContextType {
  user: User | null;
  isAuthenticated: boolean;
  isFirstTime: boolean;
  loading: boolean;
  login: (phoneNumber: string, otp: string) => Promise<void>;
  logout: () => Promise<void>;
  updateUserProfile: (data: Partial<User>) => Promise<void>;
  completeOnboarding: () => Promise<void>;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export const AuthProvider = ({ children }: { children: ReactNode }) => {
  const [user, setUser] = useState<User | null>(null);
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [isFirstTime, setIsFirstTime] = useState(true);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    checkAuthStatus();
  }, []);

  const checkAuthStatus = async () => {
    try {
      const token = await AsyncStorage.getItem('auth_token');
      const userData = await AsyncStorage.getItem('user_data');
      const hasOnboarded = await AsyncStorage.getItem('has_onboarded');

      if (token && userData) {
        setUser(JSON.parse(userData));
        setIsAuthenticated(true);
      }

      if (hasOnboarded === 'true') {
        setIsFirstTime(false);
      }
    } catch (error) {
      console.error('Error checking auth status:', error);
    } finally {
      setLoading(false);
    }
  };

  const login = async (phoneNumber: string, otp: string) => {
    try {
      setLoading(true);
      const response = await authService.verifyOTP(phoneNumber, otp);
      
      await AsyncStorage.setItem('auth_token', response.token);
      await AsyncStorage.setItem('user_data', JSON.stringify(response.user));
      
      setUser(response.user);
      setIsAuthenticated(true);
    } catch (error) {
      console.error('Login error:', error);
      throw error;
    } finally {
      setLoading(false);
    }
  };

  const logout = async () => {
    try {
      await AsyncStorage.multiRemove(['auth_token', 'user_data']);
      setUser(null);
      setIsAuthenticated(false);
    } catch (error) {
      console.error('Logout error:', error);
    }
  };

  const updateUserProfile = async (data: Partial<User>) => {
    try {
      if (!user) return;
      
      const updatedUser = { ...user, ...data };
      await AsyncStorage.setItem('user_data', JSON.stringify(updatedUser));
      setUser(updatedUser);
    } catch (error) {
      console.error('Update profile error:', error);
      throw error;
    }
  };

  const completeOnboarding = async () => {
    try {
      // Create mock user for demo (until backend is connected)
      const mockUser: User = {
        id: 'demo-user-' + Date.now(),
        phoneNumber: '+250 XXX XXX XXX',
        language: 'en',
        goals: [],
        createdAt: new Date().toISOString(),
      };

      // Save onboarding completion and user data
      await AsyncStorage.setItem('has_onboarded', 'true');
      await AsyncStorage.setItem('auth_token', 'demo-token-' + Date.now());
      await AsyncStorage.setItem('user_data', JSON.stringify(mockUser));
      
      // Update state
      setIsFirstTime(false);
      setIsAuthenticated(true);
      setUser(mockUser);
    } catch (error) {
      console.error('Complete onboarding error:', error);
    }
  };

  return (
    <AuthContext.Provider
      value={{
        user,
        isAuthenticated,
        isFirstTime,
        loading,
        login,
        logout,
        updateUserProfile,
        completeOnboarding,
      }}
    >
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => {
  const context = useContext(AuthContext);
  if (context === undefined) {
    throw new Error('useAuth must be used within an AuthProvider');
  }
  return context;
};
