import 'package:flutter/material.dart';

class TimeRange {
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  TimeRange({
    required this.startTime,
    required this.endTime,
  });

  /// Checks if a given time is within the range
  bool contains(TimeOfDay time) {
    final startMinutes = startTime.hour * 60 + startTime.minute;
    final endMinutes = endTime.hour * 60 + endTime.minute;
    final targetMinutes = time.hour * 60 + time.minute;

    return targetMinutes >= startMinutes && targetMinutes <= endMinutes;
  }

  /// Converts the TimeRange to a readable string
  @override
  String toString() {
    String formatTime(TimeOfDay time) =>
        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    return '${formatTime(startTime)} - ${formatTime(endTime)}';
  }
}
