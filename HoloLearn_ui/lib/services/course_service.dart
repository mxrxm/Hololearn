import '../models/course_models.dart';
import '../state/providers/app_state_provider.dart';

/// Handles all course-related operations locally
class CourseService {
  /// Fetch all available course codes
  static Future<List<String>> fetchCourseCodes(AppStateProvider appState) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return ['HL101', 'HL102', 'HL103', 'HL104'];
  }

  /// Fetch detailed course information by course code
  static Future<CourseDetail> getCourseByCode({
    required AppStateProvider appState,
    required String courseCode,
  }) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final details = {
      'HL101': CourseDetail(
        code: 'HL101',
        name: 'HoloLearn Foundations',
        description: 'Introduction to holographic learning design.',
        instructor: 'Prof. Holo',
        credits: 3,
        department: 'Digital Learning',
      ),
      'HL102': CourseDetail(
        code: 'HL102',
        name: 'Mixed Reality Education',
        description: 'Basics of virtual education and immersive delivery.',
        instructor: 'Dr. Reality',
        credits: 4,
        department: 'Immersive Tech',
      ),
      'HL103': CourseDetail(
        code: 'HL103',
        name: 'UI/UX for Virtual Classrooms',
        description: 'Design principles for next-gen learner interfaces.',
        instructor: 'Instructor Beam',
        credits: 2,
        department: 'Design',
      ),
    };

    return details[courseCode] ?? CourseDetail(
      code: courseCode,
      name: 'Unknown Course',
      description: 'No course details available.',
      instructor: 'Staff',
      credits: 0,
      department: 'General',
    );
  }

  /// Fetch all courses with details
  static Future<List<CourseDetail>> fetchAllCourses({
    required AppStateProvider appState,
  }) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return [
      await getCourseByCode(appState: appState, courseCode: 'HL101'),
      await getCourseByCode(appState: appState, courseCode: 'HL102'),
      await getCourseByCode(appState: appState, courseCode: 'HL103'),
    ];
  }
}
