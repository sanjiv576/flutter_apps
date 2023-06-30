import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:student_clean_arch/features/course/presentation/viewmodel/course_viewmodel.dart';

import '../../../../config/router/app_routes.dart';
import '../../../../core/common/custom_snackbar_widget.dart';
import '../../../../core/common/custom_textformfield_widget.dart';
import '../../../batch/domain/entity/batch_entity.dart';
import '../../../batch/presentation/viewmodel/batch_viewmodel.dart';
import '../../../course/domain/entity/course_entity.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  bool hide = false;
  String batchSelected = '';
  String courseSelected = '';
  final formKey = GlobalKey<FormState>();
  List<CourseEntity> _lstCourseSelected = [];

  // List<String> batchList = ['30-A', '30-B', '29-A', '29-B'];
  // List<String> courseList = ['Flutter', 'React Js'];
  // final List<CourseEntity> _courseList = [];

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController(text: '9800000000');
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  SizedBox gap = const SizedBox(height: 20);
  BatchEntity? _dropDownValueBatch;

  void _resetControllers() {
    firstNameController.clear();
    lastNameController.clear();
    usernameController.clear();
    passwordController.clear();
    _lstCourseSelected = [];
    batchSelected = '';
  }

  @override
  void dispose() {
    super.dispose();

    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  void submit() {
    showSnackbarMessage(
      contentText: 'Account has been registered successfully.',
      backgroundColor: Colors.green,
      context: context,
    );

    _resetControllers();
    Navigator.popAndPushNamed(context, AppRoutes.loginRoute);
  }

  @override
  Widget build(BuildContext context) {
    final batchState = ref.watch(batchViewModelProvider);
    final courseState = ref.watch(courseViewModelProvider);
    // final courseState = ref.watch();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register',
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(30),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextFormFieldWidget(
                    hideText: false,
                    controllerName: firstNameController,
                    textName: 'First Name'),
                gap,
                CustomTextFormFieldWidget(
                    hideText: false,
                    controllerName: lastNameController,
                    textName: 'Last Name'),
                gap,
                CustomTextFormFieldWidget(
                    hideText: false,
                    textInputType: TextInputType.number,
                    controllerName: phoneNumberController,
                    textName: 'Phone number'),
                gap,
                DropdownButtonFormField(
                  validator: (value) {
                    if (value == null) {
                      return 'Please select batch';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Select batch',
                    border: OutlineInputBorder(),
                  ),
                  items: batchState.batches
                      .map(
                        (batch) => DropdownMenuItem(
                          value: batch,
                          child: Text(batch.batchName),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _dropDownValueBatch = value;
                    });
                  },
                ),
                gap,
                MultiSelectDialogField(
                  title: const Text('Select course'),
                  items: courseState.courses
                      .map((course) => MultiSelectItem(
                            course,
                            course.courseName,
                          ))
                      .toList(),
                  listType: MultiSelectListType.CHIP,
                  buttonText: const Text('Select course'),
                  buttonIcon: const Icon(Icons.search),
                  onConfirm: (values) {
                    _lstCourseSelected.clear();
                    _lstCourseSelected.addAll(values);
                  },
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  validator: ((value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select courses';
                    }
                    return null;
                  }),
                ),
                gap,
                CustomTextFormFieldWidget(
                    hideText: false,
                    controllerName: usernameController,
                    textName: 'Username'),
                gap,
                CustomTextFormFieldWidget(
                    hideText: true,
                    controllerName: passwordController,
                    textName: 'Password '),
                gap,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          submit();
                        }
                      },
                      child: const Text('Register')),
                ),
                gap,
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/loginRoute');
                    },
                    child: const Text('Go to Login Screen'))
              ],
            ),
          ),
        ),
      )),
    );
  }
}
