import React from 'react';
import { createStackNavigator } from '@react-navigation/stack';
import { useAuth } from '../context/AuthContext';

// Auth & Onboarding Screens
import SplashScreen from '../screens/Splash/SplashScreen';
import WelcomeScreen from '../screens/Welcome/WelcomeScreen';
import PhoneRegistrationScreen from '../screens/PhoneRegistration/PhoneRegistrationScreen';
import LoginScreen from '../screens/Login/LoginScreen';
import SignupScreen from '../screens/Signup/SignupScreen';

// Main App
import MainTabNavigator from './MainTabNavigator';

export type RootStackParamList = {
  Splash: undefined;
  Welcome: undefined;
  PhoneRegistration: undefined;
  Login: undefined;
  Signup: undefined;
  Main: undefined;
};

const Stack = createStackNavigator<RootStackParamList>();

const AppNavigator = () => {
  const { isAuthenticated, loading } = useAuth();

  // For testing: Skip auth and go directly to Main
  // TODO: Remove this and uncomment auth flow for production
  return (
    <Stack.Navigator
      screenOptions={{
        headerShown: false,
        cardStyle: { backgroundColor: '#F5F5F5' },
      }}
      initialRouteName="Main"
    >
      <Stack.Screen name="Main" component={MainTabNavigator} />
      <Stack.Screen name="Splash" component={SplashScreen} />
      <Stack.Screen name="Welcome" component={WelcomeScreen} />
      <Stack.Screen name="PhoneRegistration" component={PhoneRegistrationScreen} />
      <Stack.Screen name="Login" component={LoginScreen} />
      <Stack.Screen name="Signup" component={SignupScreen} />
    </Stack.Navigator>
  );

  /* Production auth flow - uncomment when ready:
  if (loading) {
    return (
      <Stack.Navigator screenOptions={{ headerShown: false }}>
        <Stack.Screen name="Splash" component={SplashScreen} />
      </Stack.Navigator>
    );
  }

  return (
    <Stack.Navigator
      screenOptions={{
        headerShown: false,
        cardStyle: { backgroundColor: '#F5F5F5' },
      }}
      initialRouteName={isAuthenticated ? 'Main' : 'Splash'}
    >
      {!isAuthenticated ? (
        <>
          <Stack.Screen name="Splash" component={SplashScreen} />
          <Stack.Screen name="Welcome" component={WelcomeScreen} />
          <Stack.Screen name="PhoneRegistration" component={PhoneRegistrationScreen} />
          <Stack.Screen name="Login" component={LoginScreen} />
          <Stack.Screen name="Signup" component={SignupScreen} />
        </>
      ) : (
        <Stack.Screen name="Main" component={MainTabNavigator} />
      )}
    </Stack.Navigator>
  );
  */
};

export default AppNavigator;
