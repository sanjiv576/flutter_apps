import 'package:flutter/material.dart';
import 'package:student_clean_arch/widget/custom_textformfield_widget.dart';

class CourseView extends StatefulWidget {
  const CourseView({super.key});

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      child: const Text('Add Course')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
