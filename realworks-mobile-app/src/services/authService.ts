import axios from 'axios';
import Constants from 'expo-constants';

const API_URL = Constants.expoConfig?.extra?.apiUrl || 'http://localhost:5000';

interface OTPResponse {
  success: boolean;
  message: string;
}

interface VerifyOTPResponse {
  token: string;
  user: {
    id: string;
    phoneNumber: string;
    language: 'en' | 'rw';
    goals: string[];
    createdAt: string;
  };
}

export const authService = {
  sendOTP: async (phoneNumber: string): Promise<OTPResponse> => {
    try {
      const response = await axios.post(`${API_URL}/api/auth/send-otp`, {
        phoneNumber,
      });
      return response.data;
    } catch (error) {
      console.error('Send OTP error:', error);
      throw error;
    }
  },

  verifyOTP: async (phoneNumber: string, otp: string): Promise<VerifyOTPResponse> => {
    try {
      const response = await axios.post(`${API_URL}/api/auth/verify-otp`, {
        phoneNumber,
        otp,
      });
      return response.data;
    } catch (error) {
      console.error('Verify OTP error:', error);
      throw error;
    }
  },
};
