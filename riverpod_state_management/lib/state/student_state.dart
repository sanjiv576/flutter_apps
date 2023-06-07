import '../model/student.dart';

class StudentState {
  bool isLoading;
  List<Student> students;

  StudentState({required this.isLoading, required this.students});

// copyWith used here if the small thing changed

  StudentState copyWith({
    bool? isLoading,
    List<Student>? students,
  }) {
    return StudentState(
        isLoading: isLoading ?? this.isLoading,
        students: students ?? this.students);
  }

  // initial state ---> created to avoid lengthy code in student_viewmodel
  
  StudentState.initial() : this(isLoading: false, students: []);
}
