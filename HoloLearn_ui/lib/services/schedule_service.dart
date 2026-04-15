import '../models/schedule_models.dart';
import '../state/providers/app_state_provider.dart';

/// Handles schedule-related operations locally
class ScheduleService {
  static Future<List<ScheduleSlot>> fetchMyLectures(AppStateProvider appState) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return [
      ScheduleSlot(
        startTime: DateTime.now().add(const Duration(hours: 1)).toIso8601String(),
        endTime: DateTime.now().add(const Duration(hours: 2)).toIso8601String(),
        scheduleId: 101,
        lectureId: 1001,
        teacherName: 'Demo Teacher',
        lectureTitle: 'Demo Lecture Session',
        courseCode: 'HL101',
        status: 'scheduled',
        lectureType: 'live',
        date: DateTime.now().toIso8601String().split('T').first,
      ),
    ];
  }

  static Future<List<ScheduleSlot>> fetchStudentLectures(AppStateProvider appState) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return [
      ScheduleSlot(
        startTime: DateTime.now().add(const Duration(hours: 2)).toIso8601String(),
        endTime: DateTime.now().add(const Duration(hours: 3)).toIso8601String(),
        scheduleId: 201,
        lectureId: 2001,
        teacherName: 'Demo Teacher',
        lectureTitle: 'Student Demo Session',
        courseCode: 'HL102',
        status: 'upcoming',
        lectureType: 'recorded',
        date: DateTime.now().toIso8601String().split('T').first,
      ),
    ];
  }

  static Future<String> updateLecture({
    required AppStateProvider appState,
    required int scheduleId,
    required String lectureTitle,
    required String startTime,
    required String endTime,
  }) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return 'Lecture updated successfully';
  }

  static Future<String> cancelLecture({
    required AppStateProvider appState,
    required int scheduleId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return 'Lecture cancelled successfully';
  }

  static Future<List<ScheduleSlot>> fetchMyLectureHistory(AppStateProvider appState) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return [
      ScheduleSlot(
        startTime: DateTime.now().subtract(const Duration(days: 1)).toIso8601String(),
        endTime: DateTime.now().subtract(const Duration(days: 1)).add(const Duration(hours: 1)).toIso8601String(),
        scheduleId: 301,
        lectureId: 3001,
        teacherName: 'Demo Teacher',
        lectureTitle: 'Completed Demo Lecture',
        courseCode: 'HL103',
        status: 'passed',
        lectureType: 'recorded',
        date: DateTime.now().subtract(const Duration(days: 1)).toIso8601String().split('T').first,
      ),
    ];
  }
}
