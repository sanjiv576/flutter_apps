import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    //  getAllCourses();
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
}
