import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/student.dart';
import '../state/student_state.dart';

// return StudentViewModel class but its object is StudentState
final studentViewModelProvider =
    StateNotifierProvider<StudentViewModel, StudentState>(
        (ref) => StudentViewModel());

class StudentViewModel extends StateNotifier<StudentState> {
  // passing initial state of Student
  StudentViewModel() : super(StudentState.initial());

  // add user in the list
  void addStudentMarks({required Student studentMarks}) {
    // Step 1; starts loading the progress bar
    state = state.copyWith(isLoading: true);

    // Step 2:  add the student data
    state.students.add(studentMarks);

    // Step 3: stops loading the progress bar after adding
    state = state.copyWith(isLoading: false);
  }
}
