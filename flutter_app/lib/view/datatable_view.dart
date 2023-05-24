import 'package:flutter/material.dart';
import 'package:flutter_app/model/stud.dart';

class DataTableView extends StatefulWidget {
  const DataTableView({super.key});

  @override
  State<DataTableView> createState() => _DataTableViewState();
}

class _DataTableViewState extends State<DataTableView> {
  List<Stud> students = [
    Stud(firstName: 'Sanjiv', rollNo: 223),
    Stud(firstName: 'Mohan', rollNo: 23),
    Stud(firstName: 'Monika', rollNo: 123),
    Stud(firstName: 'Sundar', rollNo: 233),
  ];

  void _showAlertDialog(
      {required BuildContext context, required Stud student}) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Delete'),
        content: const Text('Do you want to delete ?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'No'),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                students.remove(student);
              });
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: DataTable(
            headingRowColor:
                MaterialStateColor.resolveWith((states) => Colors.pink),
            border: TableBorder.all(color: Colors.black),
            columns: const [
              DataColumn(
                label: Expanded(
                    child: Text(
                  'Name',
                  textAlign: TextAlign.center,
                )),
              ),
              DataColumn(
                label: Expanded(
                    child: Text('Roll No', textAlign: TextAlign.center)),
              ),
              DataColumn(
                  label: Expanded(
                      child: Text(
                'Action',
                textAlign: TextAlign.center,
              )))
            ],
            rows: [
              for (Stud student in students) ...{
                DataRow(cells: [
                  DataCell(
                    Text(student.firstName.toString()),
                  ),
                  DataCell(
                    Text(
                      student.rollNo.toString(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  DataCell(
                    Expanded(
                      child: Center(
                        child: Wrap(
                          children: [
                            IconButton(
                                onPressed: () {}, icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  _showAlertDialog(
                                      context: context, student: student);
                                },
                                icon: const Icon(Icons.delete)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ])
              }
            ],
          ),
        ),
      ),
    );
  }
}



// DataRow(cells: [
//                 const DataCell(
//                   Expanded(child: Text('John', textAlign: TextAlign.center)),
//                 ),
//                 const DataCell(
//                   Expanded(child: Text('12', textAlign: TextAlign.center)),
//                 ),
//                 DataCell(
//                   Expanded(
//                     child: Center(
//                       child: Wrap(
//                         children: [
//                           IconButton(
//                               onPressed: () {}, icon: const Icon(Icons.edit)),
//                           IconButton(
//                               onPressed: () {}, icon: const Icon(Icons.delete)),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ]),
//               DataRow(cells: [
//                 const DataCell(
//                   Text('Marry'),
//                 ),
//                 const DataCell(
//                   Text(
//                     '10',
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 DataCell(
//                   Expanded(
//                     child: Center(
//                       child: Wrap(
//                         children: [
//                           IconButton(
//                               onPressed: () {}, icon: const Icon(Icons.edit)),
//                           IconButton(
//                               onPressed: () {}, icon: const Icon(Icons.delete)),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ])
