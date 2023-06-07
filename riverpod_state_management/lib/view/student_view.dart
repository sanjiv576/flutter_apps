import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/view_model/student_viewmodel.dart';

import '../model/student.dart';

class StudentView extends ConsumerStatefulWidget {
  const StudentView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StudentViewState();
}

class _StudentViewState extends ConsumerState<StudentView> {
  final firstNameController = TextEditingController(text: 'Sanjiv');
  final lastNameController = TextEditingController(text: 'Shrestha');
  final dobController = TextEditingController(text: '12-02-2021');

  @override
  Widget build(BuildContext context) {
    // keep watching if any other changes are found then change in UI as well
    var studentState = ref.watch(studentViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextFormField(
              controller: firstNameController,
              decoration: InputDecoration(
                labelText: 'First name ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: lastNameController,
              decoration: InputDecoration(
                labelText: 'Last name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: dobController,
              decoration: InputDecoration(
                labelText: 'Date of birth',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    String firstName = firstNameController.text.trim();
                    String lastName = lastNameController.text.trim();
                     String dob = dobController.text.trim();

                    Student newStudent = Student(
                        firstName: firstName, lastName: lastName, dob: dob);

                    // print(newStudent);

                    // notifier is used to access the class  i.e StudentView Model not the object i.e StudentState
                    // becasue to access addStudent method
                    ref
                        .read(studentViewModelProvider.notifier)
                        .addStudent(student: newStudent);
                  },
                  child: const Text('Add Student')),
            ),
            const SizedBox(height: 20),
            // for showing if there is data or not
            studentState.students.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                        itemCount: studentState.students.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(studentState.students[index].firstName),
                            subtitle: Text(studentState.students[index].dob),
                            trailing: Wrap(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit),
                                ),
                                 IconButton(
                                  onPressed: () {
                                    // ref.watch(studentViewModelProvider.notifier).state = 
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                                
                              ],
                            ),
                          );
                        }),
                  )
                : const Text('NO data'),
          ],
        ),
      ),
    );
  }
}
