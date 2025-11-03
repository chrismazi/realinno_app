import React from 'react';
import { createStackNavigator } from '@react-navigation/stack';
import { useAuth } from '../context/AuthContext';

// Auth Screens
import OnboardingScreen from '../screens/Onboarding/OnboardingScreen';
import PhoneAuthScreen from '../screens/Auth/PhoneAuthScreen';
import OTPVerificationScreen from '../screens/Auth/OTPVerificationScreen';
import LanguageSelectionScreen from '../screens/Onboarding/LanguageSelectionScreen';
import GoalSelectionScreen from '../screens/Onboarding/GoalSelectionScreen';

// Main App
import MainTabNavigator from './MainTabNavigator';

export type RootStackParamList = {
  Onboarding: undefined;
  PhoneAuth: undefined;
  OTPVerification: { phoneNumber: string };
  LanguageSelection: undefined;
  GoalSelection: undefined;
  Main: undefined;
};

const Stack = createStackNavigator<RootStackParamList>();

const AppNavigator = () => {
  const { isAuthenticated, isFirstTime } = useAuth();

  return (
    <Stack.Navigator
      screenOptions={{
        headerShown: false,
        cardStyle: { backgroundColor: '#FFFFFF' },
      }}
    >
      {!isAuthenticated ? (
        <>
          {isFirstTime && (
            <Stack.Screen name="Onboarding" component={OnboardingScreen} />
          )}
          <Stack.Screen name="PhoneAuth" component={PhoneAuthScreen} />
          <Stack.Screen name="OTPVerification" component={OTPVerificationScreen} />
          <Stack.Screen name="LanguageSelection" component={LanguageSelectionScreen} />
          <Stack.Screen name="GoalSelection" component={GoalSelectionScreen} />
        </>
      ) : (
        <Stack.Screen name="Main" component={MainTabNavigator} />
      )}
    </Stack.Navigator>
  );
};

export default AppNavigator;
