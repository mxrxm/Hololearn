class AvailabilitySlot {
  final int scheduleId;
  final DateTime startTime;
  final DateTime endTime;
  final String? teacherName;
  final String? lectureTitle;
  final String status;

  AvailabilitySlot({
    required this.scheduleId,
    required this.startTime,
    required this.endTime,
    this.teacherName,
    this.lectureTitle,
    required this.status,
  });

  factory AvailabilitySlot.fromJson(Map<String, dynamic> json) {
    final date = json['date'] ?? DateTime.now().toIso8601String().split('T')[0];

    return AvailabilitySlot(
      scheduleId: json['schedule_id'],
      startTime: _parseTimeToDateTime(json['start_time'], date),
      endTime: _parseTimeToDateTime(json['end_time'], date),
      teacherName: json['teacher_name'],
      lectureTitle: json['lecture_title'],
      status: json['status'] ?? 'available',
    );
  }

  static DateTime _parseTimeToDateTime(String timeString, String dateString) {
    try {
      return DateTime.parse('${dateString}T$timeString');
    } catch (_) {
      return DateTime.now();
    }
  }

  String get formattedTimeSlot {
    final startHour = startTime.hour.toString().padLeft(2, '0');
    final startMinute = startTime.minute.toString().padLeft(2, '0');
    final endHour = endTime.hour.toString().padLeft(2, '0');
    final endMinute = endTime.minute.toString().padLeft(2, '0');
    return "$startHour:$startMinute to $endHour:$endMinute";
  }
}

class AvailabilityResponse {
  final String date;
  final List<AvailabilitySlot> availableSlots;

  AvailabilityResponse({required this.date, required this.availableSlots});

  factory AvailabilityResponse.fromJson(Map<String, dynamic> json) {
    final date = json['date'];
    return AvailabilityResponse(
      date: date,
      availableSlots: (json['available_slots'] as List)
          .map((slot) => AvailabilitySlot.fromJson(slot))
          .toList(),
    );
  }
}

class AvailabilityService {
  /// Fetch available time slots for a specific date
  static Future<AvailabilityResponse> fetchAvailableSlots({
    required String token,
    required String date,
  }) async {
    await Future.delayed(const Duration(milliseconds: 200));

    final now = DateTime.now();
    final baseDate = DateTime.tryParse('${date}T00:00:00') ?? now;

    final slots = [
      AvailabilitySlot(
        scheduleId: 1,
        startTime: DateTime(baseDate.year, baseDate.month, baseDate.day, 9, 0),
        endTime: DateTime(baseDate.year, baseDate.month, baseDate.day, 10, 0),
        teacherName: 'Demo Teacher',
        lectureTitle: 'Holo Basics',
        status: 'available',
      ),
      AvailabilitySlot(
        scheduleId: 2,
        startTime: DateTime(baseDate.year, baseDate.month, baseDate.day, 11, 0),
        endTime: DateTime(baseDate.year, baseDate.month, baseDate.day, 12, 0),
        teacherName: 'Demo Teacher',
        lectureTitle: 'Immersive Design',
        status: 'available',
      ),
    ];

    return AvailabilityResponse(date: date, availableSlots: slots);
  }
}
