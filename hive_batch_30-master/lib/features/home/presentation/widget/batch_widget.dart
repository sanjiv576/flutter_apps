import 'package:flutter/material.dart';
import 'package:hive_and_api_for_class/features/batch/domain/entity/batch_entity.dart';

class BatchWidget extends StatelessWidget {
  final List<BatchEntity> batchList;
  const BatchWidget({super.key, required this.batchList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // Put this otherwise it will take all the space
      shrinkWrap: true,
      itemCount: batchList.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1.5),
      itemBuilder: (context, index) {
        return Card(
          color: Colors.green[100],
          child: Center(
            child: Text(
              batchList[index].batchName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
