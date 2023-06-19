import 'package:flutter/material.dart';
import 'package:hive_and_api_for_class/features/course/domain/entity/course_entity.dart';

class CourseWidget extends StatelessWidget {
  final List<CourseEntity> courseList;
  const CourseWidget({super.key, required this.courseList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: courseList.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index) {
        return Card(
          color: Colors.yellow[100],
          child: Center(
            child: Text(
              courseList[index].courseName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
