import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_clean_arch/core/common/custom_textformfield_widget.dart';
import 'package:student_clean_arch/features/course/presentation/viewmodel/course_viewmodel.dart';

class CourseView extends ConsumerStatefulWidget {
  const CourseView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CourseViewState();
}

class _CourseViewState extends ConsumerState<CourseView> {
  SizedBox gap = const SizedBox(height: 20);
  final courseController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();

    courseController.dispose();
  }

  void submit() {}
  @override
  Widget build(BuildContext context) {
    final courseState = ref.read(courseViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormFieldWidget(
                  hideText: false,
                  controllerName: courseController,
                  textName: 'Course name'),
              gap,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                    },
                    child: const Text('Add Course')),
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

                                // targetedUpdateCourseId =
                                //     courseState.courses[index].courseId;

                                // // change the state of showUpdate
                                // ref
                                //     .watch(showUpdateBtnProvider.notifier)
                                //     .state = true;
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
                                          // ref
                                          //     .read(courseViewModelProvider
                                          //         .notifier)
                                          //     .deleteCourse(
                                          //       context: context,
                                          //       course: courseState
                                          //           .courses[index],
                                          //     );
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
