import '../state/providers/app_state_provider.dart';

/// Handles avatar and profile-related operations locally
class AvatarService {
  static Future<Map<String, dynamic>> checkAvatarStatus(AppStateProvider appState) async {
    await Future.delayed(const Duration(milliseconds: 200));
    await appState.setFirstTimeLogin(false);
    return {'needs_profile_setup': false};
  }

  static Future<Map<String, dynamic>> uploadAvatar({
    required AppStateProvider appState,
    dynamic photoFile,
    dynamic voiceFile,
  }) async {
    final results = <String, dynamic>{};
    if (photoFile != null) {
      results['photo'] = await uploadPhoto(appState: appState, photoFile: photoFile);
    }
    if (voiceFile != null) {
      results['voice'] = await uploadVoiceSample(appState: appState, voiceFile: voiceFile);
    }
    return results;
  }

  static Future<Map<String, dynamic>> uploadPhoto({
    required AppStateProvider appState,
    required dynamic photoFile,
  }) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return {
      'photo_url': 'https://example.com/avatar_photo.png',
      'status': 'uploaded',
    };
  }

  static Future<Map<String, dynamic>> uploadVoiceSample({
    required AppStateProvider appState,
    required dynamic voiceFile,
  }) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return {
      'voice_url': 'https://example.com/voice_sample.mp3',
      'status': 'uploaded',
    };
  }
}
