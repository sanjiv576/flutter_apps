import '../model/student.dart';

class StudentState {
  bool isLoading;
  List<Student> students;
  // List<Student> students = [
  //   Student(
  //       firstName: 'Sanjiv', lastName: 'Shrestha', module: 'Flutter', marks: 90)
  // ];

  StudentState({required this.isLoading, required this.students});

  StudentState copyWith({bool? isLoading, List<Student>? students}) {
    return StudentState(
        isLoading: isLoading ?? this.isLoading,
        students: students ?? this.students);
  }

  // initial state when it is opened for the first time
  StudentState.initial() : this(isLoading: false, students: []);
}
