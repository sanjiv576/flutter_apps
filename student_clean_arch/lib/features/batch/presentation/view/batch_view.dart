import 'package:flutter/material.dart';
import 'package:student_clean_arch/core/common/custom_textformfield_widget.dart';

class BatchView extends StatefulWidget {
  const BatchView({super.key});

  @override
  State<BatchView> createState() => _BatchViewState();
}

class _BatchViewState extends State<BatchView> {
  SizedBox gap = const SizedBox(height: 20);
  final batchController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();

    batchController.dispose();
  }

  void submit() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Batch'),
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
                    controllerName: batchController,
                    textName: 'Batch name'),
                gap,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      child: const Text('Add Batch')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
