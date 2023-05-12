import 'package:flutter/material.dart';

import '../model/student.dart';

class DisplayStudentView extends StatefulWidget {
  const DisplayStudentView({super.key});

  @override
  State<DisplayStudentView> createState() => _DisplayStudentViewState();
}

class _DisplayStudentViewState extends State<DisplayStudentView> {
  List<Student>? studentList;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    studentList = ModalRoute.of(context)!.settings.arguments as List<Student>?;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Detail',
        ),
        centerTitle: true,
        elevation: 3.0,
      ),
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2SFnnNUJhckK0xwLLdYyeKGfGFm4rb3E16A&usqp=CAU'),
                ),
                subtitle: Text('${studentList![index].address}'),
                title: Text(
                    '${studentList![index].firstName} ${studentList![index].lastName}'),
                trailing: Wrap(
                  spacing: 4,
                  children: [
                    IconButton(
                        onPressed: () {
                          // delete the data by index and again rebuild the UI
                        setState(() {
                          studentList!.removeAt(index);
                        });
                        }, icon: const Icon(Icons.delete)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, index) => const Divider(),
            itemCount: studentList!.length),
      ),
    );
  }
}


// child: Column(
//             children: [
//               for (int i = 0; i < 15; i++)
//                 const ListTile(
//                   title: Text(
//                     ('Sanjiv Shrestha'),
//                   ),
//                   subtitle: Text('KTM'),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       Icon(Icons.edit),
//                       SizedBox(
//                         width: 8.0,
//                       ),
//                       Icon(Icons.delete)
//                     ],
//                   ),
//                   isThreeLine: true,
//                 ),
//             ],
//           ),