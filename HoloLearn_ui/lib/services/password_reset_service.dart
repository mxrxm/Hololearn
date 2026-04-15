class PasswordResetService {
  /// Request OTP code locally
  static Future<String> requestOTP(String email) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return 'OTP sent successfully to $email';
  }

  /// Verify OTP code locally
  static Future<Map<String, dynamic>> verifyOTP(
    String email,
    String otpCode,
  ) async {
    await Future.delayed(const Duration(milliseconds: 200));
    if (otpCode != '123456') {
      throw Exception('Invalid OTP code');
    }
    return {'email': email, 'verified': true};
  }

  /// Reset password locally
  static Future<String> resetPassword({
    required String email,
    required String otpCode,
    required String newPassword,
  }) async {
    await Future.delayed(const Duration(milliseconds: 200));
    if (otpCode != '123456') {
      throw Exception('Invalid OTP code');
    }
    return 'Password reset successfully';
  }

  static Future<String> changePassword({
    required String email,
    required String oldPassword,
    required String newPassword,
  }) async {
    await Future.delayed(const Duration(milliseconds: 200));
    if (oldPassword != 'oldPassword') {
      throw Exception('Old password is incorrect');
    }
    return 'Password changed successfully';
  }

  /// Resend OTP code locally
  static Future<String> resendOTP(String email) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return 'OTP resent successfully to $email';
  }
}
