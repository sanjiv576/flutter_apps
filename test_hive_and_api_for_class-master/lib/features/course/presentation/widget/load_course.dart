import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/features/course/domain/entity/course_entity.dart';

import '../viewmodel/course_viewmodel.dart';

class LoadCourse extends StatelessWidget {
  final WidgetRef ref;
  final List<CourseEntity> lstCourse;
  const LoadCourse({super.key, required this.lstCourse, required this.ref});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lstCourse.length,
      itemBuilder: ((context, index) => ListTile(
          title: Text(lstCourse[index].courseName),
          subtitle: Text(lstCourse[index].courseName),
          trailing: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                      'Are you sure you want to delete ${lstCourse[index].courseName}?'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('No')),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          ref
                              .read(courseViewModelProvider.notifier)
                              .deleteCourse(context, lstCourse[index]);
                        },
                        child: const Text('Yes')),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.delete),
          ))),
    );
  }
}
