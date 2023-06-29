import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/features/course/domain/entity/course_entity.dart';
import 'package:hive_and_api_for_class/features/course/presentation/viewmodel/course_viewmodel.dart';

final showUpdateBtnProvider = StateProvider<bool>((ref) => false);

class AddCourseView extends ConsumerStatefulWidget {
  const AddCourseView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddCourseViewState();
}

class _AddCourseViewState extends ConsumerState<AddCourseView> {
  final courseController = TextEditingController();
  var gap = const SizedBox(height: 8);
  final _formKey = GlobalKey<FormState>();
  String? targetedUpdateCourseId;
  void _addNewCourse() {
    CourseEntity newCourse =
        CourseEntity(courseName: courseController.text.trim());
    ref.watch(courseViewModelProvider.notifier).addCourse(newCourse);
  }

  void _updateCourse(String courseId, CourseEntity course) {
    print('Course id is : ${targetedUpdateCourseId!}');
    ref.watch(courseViewModelProvider.notifier).updateCourse(courseId, course);
  }

  @override
  Widget build(BuildContext context) {
    var courseState = ref.watch(courseViewModelProvider);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              gap,
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Add Course',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              gap,
              TextFormField(
                controller: courseController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Course Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter course name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (ref.watch(showUpdateBtnProvider)) {
                        CourseEntity updatedCourse = CourseEntity(
                          courseName: courseController.text.trim(),
                          courseId: targetedUpdateCourseId,
                        );

                        _updateCourse(targetedUpdateCourseId!, updatedCourse);
                        ref.watch(showUpdateBtnProvider.notifier).state = false;
                        courseController.clear();
                      } else {
                        _addNewCourse();
                      }
                    }
                  },
                  child: Text(
                      '${ref.watch(showUpdateBtnProvider) ? 'Update' : 'Add'} Course'),
                ),
              ),
              gap,
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'List of Courses',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              gap,
              if (courseState.isLoading) ...{
                const CircularProgressIndicator(),
              } else if (courseState.error != null) ...{
                Text(courseState.error!),
              } else if (courseState.courses.isNotEmpty) ...{
                Expanded(
                    // child: LoadCourse(
                    //   lstCourse: courseState.courses,
                    //   ref: ref,
                    // ),

                    child: ListView.builder(
                  itemCount: courseState.courses.length,
                  itemBuilder: ((context, index) => ListTile(
                      title: Text(courseState.courses[index].courseName),
                      subtitle: Text(courseState.courses[index].courseName),
                      trailing: Wrap(
                        direction: Axis.horizontal,
                        children: [
                          IconButton(
                              onPressed: () {
                                courseController.text =
                                    courseState.courses[index].courseName;

                                targetedUpdateCourseId =
                                    courseState.courses[index].courseId;

                                // change the state of showUpdate
                                ref
                                    .watch(showUpdateBtnProvider.notifier)
                                    .state = true;
                              },
                              icon: const Icon(Icons.edit)),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                      'Are you sure you want to delete ${courseState.courses[index].courseName}?'),
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
                                              .read(courseViewModelProvider
                                                  .notifier)
                                              .deleteCourse(
                                                context: context,
                                                course:
                                                    courseState.courses[index],
                                              );
                                        },
                                        child: const Text('Yes')),
                                  ],
                                ),
                              );
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ))),
                )),
              }
            ],
          ),
        ),
      ),
    );
  }
}
