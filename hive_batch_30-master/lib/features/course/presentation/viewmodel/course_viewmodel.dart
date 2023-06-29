import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/features/course/domain/entity/course_entity.dart';
import 'package:hive_and_api_for_class/features/course/domain/use_case/course_usecase.dart';
import 'package:hive_and_api_for_class/features/course/presentation/state/course_state.dart';

import '../../../../core/common/snackbar/my_snackbar.dart';

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

  Future<void> addCourse(CourseEntity course) async {
    state.copyWith(isLoading: true);
    var data = await courseUsecase.addCourse(course);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) {
        // add new course in the state as well
        state.courses.add(course);
        state = state.copyWith(isLoading: false, error: null);
      },
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

// Step 4delete

  Future<void> deleteCourse({
    required BuildContext context,
    // passing all data of that course because later its name is also required for furhter
    required CourseEntity course,
  }) async {
    // load the progress bar
    state = state.copyWith(isLoading: true);

    // data comes here and passing course id only
    var data = await courseUsecase.deleteCourse(course.courseId!);

    data.fold(
      (l) {
        showSnackBar(message: l.error, context: context, color: Colors.red);

        state = state.copyWith(isLoading: false, error: l.error);
      },
      (r) {
        // remove that course only from the state
        state.courses.remove(course);
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(
          message: 'Course delete successfully',
          context: context,
        );
      },
    );
  }

  // update a course
  Future<void> updateCourse(String courseId, CourseEntity course) async {
    state = state.copyWith(isLoading: true);

    var data = await courseUsecase.updateCourse(courseId, course);
    data.fold((l) => state = state.copyWith(isLoading: false, error: l.error),
        (r) {
      // remove from the list
      state.courses.removeWhere((element) => element.courseId == courseId);
      // add the updated value in the end of the list
      state.courses.add(course);

      state = state.copyWith(isLoading: false, error: null);
    });
  }
}
