import '../models/lecture_model.dart';
import '../state/providers/app_state_provider.dart';

/// Handles all lecture-related operations locally
class LectureService {
  /// Create lecture draft stub
  static Future<LectureCreateResponse> createLectureDraft({
    required AppStateProvider appState,
    required String title,
    required String courseCode,
    required String filePath,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return LectureCreateResponse(
      title: title,
      lectureId: 1001,
      teacherId: 1,
      lectureType: 'recorded',
      courseCode: courseCode,
    );
  }

  /// Confirm and publish lecture stub
  static Future<LecturePublishResponse> confirmAndPublishLecture({
    required AppStateProvider appState,
    required int lectureId,
    required int scheduleId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final now = DateTime.now();
    return LecturePublishResponse(
      message: 'Lecture published successfully',
      lectureId: lectureId,
      scheduleId: scheduleId,
      lectureTitle: 'Published Lecture',
      courseCode: 'HL101',
      lectureStatus: 'published',
      scheduleStatus: 'reserved',
      scheduledDate: now.toIso8601String().split('T').first,
      startTime: '09:00',
      endTime: '10:00',
    );
  }

  /// Fetch lecture details by schedule_id stub
  static Future<LectureDetailResponse> getLectureByScheduleId({
    required AppStateProvider appState,
    required int scheduleId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return LectureDetailResponse(
      lectureId: 1001,
      scheduleId: scheduleId,
      title: 'Demo Lecture',
      courseCode: 'HL101',
      currentFileUrl: 'https://example.com/demo.pdf',
      currentFileName: 'demo.pdf',
      scheduledDate: DateTime.now().toIso8601String().split('T').first,
      startTime: '09:00',
      endTime: '10:00',
      status: 'scheduled',
    );
  }

  /// Update lecture stub
  static Future<LectureUpdateResponse> updateLecture({
    required AppStateProvider appState,
    required int oldScheduleId,
    required String title,
    required String courseCode,
    int? newScheduleId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return LectureUpdateResponse(
      message: 'Lecture updated successfully',
      lectureId: 1001,
      scheduleId: newScheduleId ?? oldScheduleId,
      lectureTitle: title,
      courseCode: courseCode,
      lectureStatus: 'updated',
      scheduledDate: DateTime.now().toIso8601String().split('T').first,
      startTime: '09:00',
      endTime: '10:00',
      scheduleStatus: 'reserved',
      fileUpdated: false,
      fileUrl: null,
      scheduleChanged: newScheduleId != null,
    );
  }

  /// Delete lecture stub
  static Future<void> deleteLecture({
    required AppStateProvider appState,
    required int lectureId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 200));
  }
}
