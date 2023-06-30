import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hive_and_api_for_class/features/course/domain/entity/course_entity.dart';

Future<List<CourseEntity>> getCourseListTest() async {
  final response =
      await rootBundle.loadString('test_data/course_test_data.json');
  final jsonList = await json.decode(response);
  final List<CourseEntity> courseList = jsonList
      .map<CourseEntity>((json) => CourseEntity.fromJson(json))
      .toList();

  return Future.value(courseList);
}


