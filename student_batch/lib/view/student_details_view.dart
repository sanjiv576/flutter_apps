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
          separatorBuilder: (BuildContext context, index) => const Divider(),
          itemCount: selectedStudents!.length,
          itemBuilder: (context, index) {
            var fname = selectedStudents![index].fname;
            var lname = selectedStudents![index].lname;
            var batch = selectedStudents![index].batchId;
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      GestureDetector(
                        onDoubleTap: () {
                          print('Double tap on the screen');
                          setState(() {
                            selectedStudents!.removeAt(index);
                          });
                        },
                        child: SizedBox(
                          height: 500,
                          width: double.infinity,
                          // color: Colors.pink,
                          child: Image.network(
                              'https://cdn.pixabay.com/photo/2020/11/28/03/19/iron-man-5783522_640.png'),
                        ),
                      ),
                      Positioned(
                        top: 1,
                        right: 1,
                        child: IconButton(
                            onPressed: () {
                              print('Edit icon got pressed');
                            },
                            icon: const Icon(Icons.edit)),
                      ),
                      Positioned(
                        bottom: 1,
                        left: 1,
                        child: Wrap(
                          children: [
                            IconButton(
                              onPressed: () {
                                print('Like icon got pressed');
                              },
                              icon: const Icon(Icons.thumb_up),
                            ),
                            IconButton(
                              onPressed: () {
                                print('Message icon got pressed');
                              },
                              icon: const Icon(Icons.message),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('$fname $lname'),
                      Text(batch.toString()),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


// previous work in ListView with ListTile
// child: ListView.separated(
//            separatorBuilder: (BuildContext context, index) =>
//                const Divider(),
//            itemCount: selectedStudents!.length,
//            itemBuilder: (context, index) {
//              var fname = selectedStudents![index].fname;
//              var lname = selectedStudents![index].lname;
//              var batch = selectedStudents![index].batchId;
//              return ListTile(
//                leading: const CircleAvatar(
//                  radius: 40,
//                  backgroundColor: Colors.black,
//                  backgroundImage: NetworkImage(
//                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2SFnnNUJhckK0xwLLdYyeKGfGFm4rb3E16A&usqp=CAU'),
//                ),
//                title: Text('$fname $lname'),
//                subtitle: Text(
//                  batch.toString(),
//                ),
//              );
//            },
//          ),
