import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_clean_arch/core/common/custom_textformfield_widget.dart';
import 'package:student_clean_arch/features/batch/presentation/viewmodel/batch_viewmodel.dart';

class BatchView extends ConsumerStatefulWidget {
  const BatchView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BatchViewState();
}

class _BatchViewState extends ConsumerState<BatchView> {
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
    final batchState = ref.read(batchViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Batch'),
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
                  controllerName: batchController,
                  textName: 'Batch name'),
              gap,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                    },
                    child: const Text('Add Batch')),
              ),
              gap,
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'List of Batches',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (batchState.isLoading) ...{
                const Center(child: CircularProgressIndicator()),
              }
              // else if (batchState.error != null) ...{
              //   Text(batchState.error.toString()),
              // }
              else if (batchState.batches.isEmpty) ...{
                const Center(child: Text('No Batches')),
              } else ...{
                Expanded(
                  // child: LoadBatch(
                  //   lstBatches: batchState.batches,
                  //   ref: ref,
                  // ),

                  child: ListView.builder(
                    itemCount: batchState.batches.length,
                    itemBuilder: ((context, index) => ListTile(
                          title: Text(batchState.batches[index].batchName),
                          subtitle: Text(batchState.batches[index].batchName),
                          trailing: Wrap(
                            direction: Axis.horizontal,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    // targetedUpdateBatchId =
                                    //     batchState.batches[index].batchId;
                                    // batchController.text =
                                    //     batchState.batches[index].batchName;

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
                                          'Are you sure you want to delete ${batchState.batches[index].batchName} at index $index?'),
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
                                              //     .read(batchViewModelProvider
                                              //         .notifier)
                                              //     .deleteBatch(context,
                                              //         batchState.batches[index]);
                                            },
                                            child: const Text('Yes')),
                                      ],
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              },
            ],
          ),
        ),
      ),
    );
  }
}
