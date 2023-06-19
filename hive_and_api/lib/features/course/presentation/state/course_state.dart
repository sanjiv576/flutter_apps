import 'package:hive_and_api_for_class/features/course/domain/entity/course_entity.dart';

class CourseState {
  final bool isLoading;
  final String? error;
  final List<CourseEntity> courses;

  const CourseState({
    required this.isLoading,
    required this.error,
    required this.courses,
  });

  factory CourseState.initial() => const CourseState(
        isLoading: false,
        error: null,
        courses: [],
      );

  CourseState copyWith({
    bool? isLoading,
    String? error,
    List<CourseEntity>? courses,
  }) {
    return CourseState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      courses: courses ?? this.courses,
    );
  }
}
