

import 'package:flutter_app/model/stud.dart';

class StudentState {
  // private constructor to restrict creating object
  StudentState._();

  static List<Stud> students = [
    Stud(firstName: 'Sanjiv', rollNo: 223),
    Stud(firstName: 'Mohan', rollNo: 23),
    Stud(firstName: 'Monika', rollNo: 123),
    Stud(firstName: 'Sundar', rollNo: 233),
  ];
}
