import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_marks_mvvm/logic/student_result.dart';
import 'package:student_marks_mvvm/model/student.dart';

import '../state/module_state.dart';
import '../state/student_state.dart';
import '../view_model/student_viewmodel.dart';

final addButtonShowProvider = StateProvider<bool>((ref) => true);
final moduleNameProvider = StateProvider<String>((ref) => 'Select module');

class StudentMarksView extends ConsumerStatefulWidget {
  const StudentMarksView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StudentMarksViewState();
}

class _StudentMarksViewState extends ConsumerState<StudentMarksView> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final marksController = TextEditingController();
  int counter = 0;

  String? selectedModule;
  final formKey = GlobalKey<FormState>();

  late StudentState studentState;

  StudentResult? studentResult;

  void getStudentData() {
    studentState = ref.watch(studentViewModelProvider);
  }

  @override
  void dispose() {
    super.dispose();

    firstNameController.dispose();
    lastNameController.dispose();
    marksController.dispose();
  }

  void submit() {
    Student studentMarks = Student(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      module: selectedModule.toString(),
      marks: double.parse(marksController.text.trim()),
    );

    // print(studentMarks);

    // add the student
    // notifier is used to access the class  i.e StudentView Model not the object i.e StudentState
    ref
        .read(studentViewModelProvider.notifier)
        .addStudentMarks(studentMarks: studentMarks);

    // increment the counter
    ++counter;

    if (isMarkingComplete()) {
      counter = 0;
      // hide the add button
      ref.read(addButtonShowProvider.notifier).state = false;

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Marking is completed. Now, view the result.'),
        backgroundColor: Colors.pink,
        elevation: 10,
      ));

      // initialize the result

      studentResult = StudentResult(
        flutterMarks: studentState.students[0].marks,
        apiMarks: studentState.students[1].marks,
        designMarks: studentState.students[2].marks,
        individualProMarks: studentState.students[3].marks,
      );

      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Student Marks added successfully'),
      backgroundColor: Colors.green,
    ));

    marksController.clear();
    ref.read(moduleNameProvider.notifier).state = 'Select another module';
    selectedModule = '';
  }

  void reset() {
    // change the message for moudle selection
    ref.read(moduleNameProvider.notifier).state = 'Select module';

    // empty the student list
    studentState.students = [];

    // recall this screen that starts from beginning
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const StudentMarksView()));
  }

  bool isMarkingComplete() => counter >= 4;

  SizedBox gap = const SizedBox(height: 20);
  @override
  Widget build(BuildContext context) {
    // student state
    // StudentState studentState = ref.watch(studentViewModelProvider);
    getStudentData();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Marks',
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: firstNameController,
                  validator: (value) =>
                      value!.isEmpty ? 'Enter first name' : null,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                  ),
                ),
                gap,
                TextFormField(
                  controller: lastNameController,
                  validator: (value) =>
                      value!.isEmpty ? 'Enter last name' : null,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                  ),
                ),
                gap,
                DropdownButtonFormField(
                  validator: (value) => value == null ? 'Select module' : null,
                  decoration: InputDecoration(
                    labelText: ref.watch(moduleNameProvider).toString(),
                    border: const OutlineInputBorder(),
                  ),
                  items: ModuleState.modules
                      .map(
                        (batch) => DropdownMenuItem(
                          value: batch,
                          child: Text(batch),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedModule = value;
                    });
                  },
                ),
                gap,
                TextFormField(
                  controller: marksController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter marks';
                    } else if (double.parse(value) < 0) {
                      return 'Marks cannot be less than 0';
                    } else if (double.parse(value) > 100) {
                      return 'Marks cannot be greater than 100';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Marks',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                  ),
                ),
                gap,
                ref.watch(addButtonShowProvider)
                    ? SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                submit();
                              }
                            },
                            child: const Text('Add Marks')),
                      )
                    : Container(
                        child: null,
                      ),
                gap,
                Row(
                  children: [
                    Expanded(
                      child: FittedBox(
                        child: DataTable(
                            dataRowHeight: 80,
                            headingRowHeight: 90,
                            headingTextStyle: const TextStyle(fontSize: 50),
                            headingRowColor: MaterialStateColor.resolveWith(
                                (states) => Colors.pink),
                            border: TableBorder.all(color: Colors.black),
                            // columnSpacing: 12,
                            columns: [
                              for (var module in ModuleState.modules) ...{
                                DataColumn(
                                    label: Text(
                                  module,
                                  style: const TextStyle(fontSize: 20),
                                ))
                              }
                            ],
                            rows: [
                              DataRow(cells: [
                                DataCell(Text(
                                  studentState.students.isNotEmpty
                                      ? studentState.students[0].marks
                                          .toString()
                                      : '00',
                                  style: const TextStyle(fontSize: 40),
                                )),
                                DataCell(Text(
                                  studentState.students.length >= 2
                                      ? studentState.students[1].marks
                                          .toString()
                                      : '00',
                                  style: const TextStyle(fontSize: 40),
                                )),
                                DataCell(Text(
                                  studentState.students.length >= 3
                                      ? studentState.students[2].marks
                                          .toString()
                                      : '00',
                                  style: const TextStyle(fontSize: 40),
                                )),
                                DataCell(Text(
                                  studentState.students.length == 4
                                      ? studentState.students[3].marks
                                          .toString()
                                      : '00',
                                  style: const TextStyle(fontSize: 40),
                                )),
                              ]),
                            ]),
                      ),
                    ),
                  ],
                ),
                gap,
                studentState.students.isNotEmpty
                    ? Text(ref.watch(addButtonShowProvider)
                        ? 'Preparing Result'
                        : 'Result')
                    : const Text('Resut Not avalable'),
                gap,

                // show reset button if the add button is shown == false
                !ref.watch(addButtonShowProvider)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                  'Total Marks : ${studentResult!.totalMarks()}'),
                              gap,
                              Text('Result : ${studentResult!.resultStatus()}'),
                              gap,
                              Text('Division : ${studentResult!.division()}'),
                            ],
                          ),
                          gap,
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  reset();
                                },
                                child: const Text('Reset All')),
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
