import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/features/batch/presentation/viewmodel/batch_view_model.dart';

import '../../../../config/constants/api_endpoint.dart';

class BatchStudentView extends ConsumerStatefulWidget {
  final String? batchName;
  const BatchStudentView(this.batchName, {super.key});

  @override
  ConsumerState<BatchStudentView> createState() => _BatchStudentViewState();
}

class _BatchStudentViewState extends ConsumerState<BatchStudentView> {
  @override
  Widget build(BuildContext context) {
    var studentState = ref.watch(batchViewModelProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Students in ${widget.batchName} Batch',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (studentState.isLoading) ...{
              const CircularProgressIndicator(),
            } else if (studentState.error != null) ...{
              Text(studentState.error!),
            } else if (studentState.students!.isEmpty) ...{
              const Center(
                child: Text('No Students'),
              ),
            } else ...{
              Expanded(
                child: ListView.builder(
                  itemCount: studentState.students!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: SizedBox(
                        height: 200,
                        child: Image.network(
                          ApiEndpoints.imageUrl +
                              studentState.students![index].image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(studentState.students![index].fname),
                      subtitle: Text(studentState.students![index].lname),
                    );
                  },
                ),
              ),
            },
          ],
        ),
      ),
    );
  }
}
