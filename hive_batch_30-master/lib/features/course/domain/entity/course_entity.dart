import 'package:equatable/equatable.dart';

class CourseEntity extends Equatable {
  final String? courseId;
  final String courseName;

  const CourseEntity({
    this.courseId,
    required this.courseName,
  });

  factory CourseEntity.fromJson(Map<String, dynamic> json) {
    return CourseEntity(
      courseId: json['courseId'] as String?,
      courseName: json['courseName'] as String,
    );
  }

  @override
  List<Object?> get props => [courseId, courseName];
}
