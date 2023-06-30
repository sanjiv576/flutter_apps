import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/core/common/snackbar/my_snackbar.dart';
import 'package:hive_and_api_for_class/features/course/domain/entity/course_entity.dart';
import 'package:hive_and_api_for_class/features/course/domain/use_case/course_usecase.dart';
import 'package:hive_and_api_for_class/features/course/presentation/state/course_state.dart';

final courseViewModelProvider =
    StateNotifierProvider<CourseViewModel, CourseState>(
  (ref) => CourseViewModel(
    ref.read(courseUseCaseProvider),
  ),
);

class CourseViewModel extends StateNotifier<CourseState> {
  final CourseUseCase courseUsecase;
  CourseViewModel(this.courseUsecase) : super(CourseState.initial()) {
    getAllCourses();
  }

  Future<void> deleteCourse(BuildContext context, CourseEntity course) async {
    state.copyWith(isLoading: true);
    var data = await courseUsecase.deleteCourse(course.courseId!);

    data.fold(
      (l) {
        showSnackBar(message: l.error, context: context, color: Colors.red);

        state = state.copyWith(isLoading: false, error: l.error);
      },
      (r) {
        state.courses.remove(course);
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(
          message: 'Course delete successfully',
          context: context,
        );
      },
    );
  }

  Future<void> addCourse(CourseEntity course) async {
    state.copyWith(isLoading: true);
    var data = await courseUsecase.addCourse(course);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, error: null),
    );
  }

  Future<void> getAllCourses() async {
    state = state.copyWith(isLoading: true);
    var data = await courseUsecase.getAllCourses();

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, courses: r),
    );
  }

  // Future<void> getAllStudentsByBatch(String batchId) {
  //   state = state.copyWith(isLoading: true);
  //   var data = courseUsecase.getAllStudentsByBatch(batchId);

  //   data.fold(
  //     (l) => state = state.copyWith(isLoading: false, error: l.error),
  //     (r) => state = state.copyWith(isLoading: false, courses: r),
  //   );
  // }
}
