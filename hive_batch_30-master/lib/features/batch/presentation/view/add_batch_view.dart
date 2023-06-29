import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/features/batch/domain/entity/batch_entity.dart';

import '../viewmodel/batch_view_model.dart';

// final batchState =
//     StateProvider((ref) => ref.read(batchViewModelProvider));

class AddBatchView extends ConsumerStatefulWidget {
  const AddBatchView({super.key});

  @override
  ConsumerState<AddBatchView> createState() => _AddBatchViewState();
}

final showUpdateBtnProvider = StateProvider<bool>((ref) => false);

class _AddBatchViewState extends ConsumerState<AddBatchView> {
  final gap = const SizedBox(height: 8);
  final batchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? targetedUpdateBatchId;

  void _addBatch() {
    BatchEntity newBatch = BatchEntity(batchName: batchController.text.trim());
    ref.watch(batchViewModelProvider.notifier).addBatch(newBatch, context);
    // Navigator.popAndPushNamed(context, AppRoute.addCourseRoute);
  }

  void _updateBatch(String batchId, BatchEntity batch) {
    ref.watch(batchViewModelProvider.notifier).updateBatch(batchId, batch);
  }

  @override
  Widget build(BuildContext context) {
    var batchState = ref.watch(batchViewModelProvider);
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
                  'Add Batch',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              gap,
              TextFormField(
                controller: batchController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Batch Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter batch';
                  }
                  return null;
                },
              ),
              gap,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (ref.watch(showUpdateBtnProvider)) {
                        BatchEntity updatedBatch = BatchEntity(
                          batchName: batchController.text.trim(),
                          batchId: targetedUpdateBatchId,
                        );

                        _updateBatch(targetedUpdateBatchId!, updatedBatch);
                        batchController.clear();
                        ref.watch(showUpdateBtnProvider.notifier).state = false;
                      } else {
                        _addBatch();
                      }
                    }
                  },
                  child: Text(
                      '${ref.watch(showUpdateBtnProvider) ? 'Update' : 'Add'} Batch'),
                ),
              ),
              const SizedBox(height: 10),
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
                                  targetedUpdateBatchId =
                                      batchState.batches[index].batchId;
                                  batchController.text =
                                      batchState.batches[index].batchName;

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
                                            ref
                                                .read(batchViewModelProvider
                                                    .notifier)
                                                .deleteBatch(context,
                                                    batchState.batches[index]);
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
                )),
              }
            ],
          ),
        ),
      ),
    );
  }
}
