import 'package:flutter/material.dart';
import 'package:student_batch/state/student_state.dart';

import '../model/student.dart';

class StudentDetailView extends StatefulWidget {
  const StudentDetailView({super.key});

  @override
  State<StudentDetailView> createState() => _OutputViewState();
}

class _OutputViewState extends State<StudentDetailView> {
  String? selectBatch;
  List<Student>? selectedStudents;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

// store the selected batch
    selectBatch = ModalRoute.of(context)!.settings.arguments as String?;
    // print('Select batch is $selectBatch');

    // filter or select only selected batch
    selectedStudents = StudentState.students
        .where((student) => student.batchId == selectBatch!)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students View'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.separated(
           separatorBuilder: (BuildContext context, index) =>
               const Divider(),
           itemCount: selectedStudents!.length,
           itemBuilder: (context, index) {
             var fname = selectedStudents![index].fname;
             var lname = selectedStudents![index].lname;
             var batch = selectedStudents![index].batchId;
             return ListTile(
               leading: const CircleAvatar(
                 radius: 40,
                 backgroundColor: Colors.black,
                 backgroundImage: NetworkImage(
                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2SFnnNUJhckK0xwLLdYyeKGfGFm4rb3E16A&usqp=CAU'),
               ),
               title: Text('$fname $lname'),
               subtitle: Text(
                 batch.toString(),
               ),
             );
           },
         ),
      ),
    );
  }
}
