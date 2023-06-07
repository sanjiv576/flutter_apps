import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/state/student_state.dart';

import '../model/student.dart';

// NOte: StateNotifier is used -->  if the class or object is needed to be returned
// Note: StateProvider , if the primitive data type like

// return StudentViewModel class but its object is StudentState
final studentViewModelProvider =
    StateNotifierProvider<StudentViewModel, StudentState>(
        (ref) => StudentViewModel());

class StudentViewModel extends StateNotifier<StudentState> {
  // passsing default values  to the parent class i.e from StudentState to StateNotifier
  // when the screen is opened for the first time
  // Note: super => calling parent , this => current

  // passing initial state of Student
  StudentViewModel() : super(StudentState.initial());

  // add student --> never use return type
  void addStudent({required Student student}) {
    // turn on the progress bar  ==> which means it is processing to add studetn
    // Note: state ==> is StudentState here, look in the StateNotifier<StudentState>
    state = state.copyWith(isLoading: true);

    // Student lai state ma add gara

    state.students.add(student);

    // turn off the progress bar
    state = state.copyWith(isLoading: false);
  }

  

  // get studnet
}
