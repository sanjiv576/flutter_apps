// tells where the changes occur
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_clean_arch/features/course/domain/entity/course_entity.dart';

import '../../domain/use_case/course_use_case.dart';
import '../state/course_state.dart';

// StateNotifierProvider is used here because we use StateNotifier (look in BatchViewModel class)
final courseViewModelProvider =
    StateNotifierProvider<CourseViewModel, CourseState>(
  (ref) => CourseViewModel(ref.read(courseUseCaseProvider)),
);

// class
class CourseViewModel extends StateNotifier<CourseState> {
  final CourseUseCase courseUseCase;

  CourseViewModel(this.courseUseCase) : super(CourseState.initial()) {
    getAllCourses();
  }

  // Never returns any thing here, we all do in courseState
  Future<void> addBatch(CourseEntity course) async {
    state.copyWith(isLoading: true);
    var data = await courseUseCase.addCourse(course);

    data.fold(
      (left) => state = state.copyWith(
          isLoading: false, error: left.error), // here comes failure
      (right) => state = state.copyWith(
          isLoading: false, error: null), // here comes bool value
    );
  }

  Future<void> getAllCourses() async {
    state.copyWith(isLoading: true);
    var data = await courseUseCase.getAllCourses();

    data.fold(
      (left) => state = state.copyWith(
          isLoading: false, error: left.error), // here comes failure
      (right) => state = state.copyWith(
          isLoading: false, courses: right), // here comes list of courses
    );
  }
}
