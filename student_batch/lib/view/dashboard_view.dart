import 'package:flutter/material.dart';
import 'package:student_batch/state/batch_state.dart';
import 'package:student_batch/state/student_state.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  SizedBox gap = const SizedBox(height: 30);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Lenght of students: ${StudentState.students.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: BatchState.batches.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // print('Index $index');
                  Navigator.pushNamed(context, '/studentDetailRoute',
                      arguments: BatchState.batches[index]);
                },
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.pink,
                  child: Text(BatchState.batches[index]),
                ),
              );
            }),
      ),
    );
  }
}
 

//  child: ListView.separated(
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 onTap: () {
//                   // print('Index $index');
//                   Navigator.pushNamed(context, '/studentDetailRoute',
//                       arguments: BatchState.batches[index]);
//                 },
//                 child: ListTile(
//                   leading: const Icon(Icons.person),
//                   title: Text(BatchState.batches[index]),
//                 ),
//               );
//             },
//             separatorBuilder: (context, index) {
//               return const Divider(
//                 color: Colors.transparent,
//               );
//             },
//             itemCount: BatchState.batches.length),

