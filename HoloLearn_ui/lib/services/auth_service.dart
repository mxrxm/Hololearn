class AuthService {
  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 250));

    final normalizedEmail = email.toLowerCase();
    final users = {
      'teacher@example.com': {
        'password': 'teacher123',
        'role': 'teacher',
        'full_name': 'Demo Teacher',
      },
      'student@example.com': {
        'password': 'student123',
        'role': 'student',
        'full_name': 'Demo Student',
      },
    };

    final account = users[normalizedEmail];

    if (account == null || account['password'] != password) {
      throw Exception('Login failed: Incorrect email or password.');
    }

    return {
      'access_token': 'fake_token_${account['role']}',
      'token_type': 'Bearer',
      'user': {
        'email': normalizedEmail,
        'full_name': account['full_name'],
        'role': account['role'],
        'photo_url': null,
        'voice_url': null,
      },
    };
  }
}
