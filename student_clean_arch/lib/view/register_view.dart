import 'package:flutter/material.dart';

import '../widget/custom_textformfield_widget.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String textName = 'first name';
  bool hide = false;
  String batchSelected = '';
  String courseSelected = '';
  final formKey = GlobalKey<FormState>();

  List<String> batchList = ['30-A', '30-B', '29-A', '29-B'];
  List<String> courseList = ['Flutter', 'React Js'];

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  SizedBox gap = const SizedBox(height: 20);

  @override
  void dispose() {
    super.dispose();

    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  void submit() {}

  @override
  Widget build(BuildContext context) {
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
                  items: batchList
                      .map(
                        (batch) => DropdownMenuItem(
                          value: batch,
                          child: Text(batch),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      batchSelected = value!;
                    });
                    print(batchSelected);
                  },
                ),
                gap,
                DropdownButtonFormField(
                  validator: (value) {
                    if (value == null) {
                      return 'Please select course';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Select Course',
                    border: OutlineInputBorder(),
                  ),
                  items: courseList
                      .map(
                        (course) => DropdownMenuItem(
                          value: course,
                          child: Text(course),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      courseSelected = value!;
                    });
                    // print(courseSelected);
                  },
                ),
                // SearchableDropdown<int>(
                //   hintText: const Text('List of items'),
                //   margin: const EdgeInsets.all(15),
                //   items: List.generate(
                //       10,
                //       (i) => SearchableDropdownMenuItem(
                //           value: i, label: 'item $i', child: Text('item $i'))),
                //   onChanged: (int? value) {
                //     debugPrint('$value');
                //   },
                // ),
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
