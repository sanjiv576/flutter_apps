import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/config/constants/hive_table_constant.dart';
import 'package:hive_and_api_for_class/features/batch/domain/entity/batch_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'batch_hive_model.g.dart';

final batchHiveModelProvider = Provider(
  (ref) => BatchHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.batchTableId)
class BatchHiveModel {
  @HiveField(0)
  final String batchId;

  @HiveField(1)
  final String batchName;

  // empty constructor
  BatchHiveModel.empty() : this(batchId: '', batchName: '');

  BatchHiveModel({
    String? batchId,
    required this.batchName,
  }) : batchId = batchId ?? const Uuid().v4();

  // Convert Hive Object to Entity
  BatchEntity toEntity() => BatchEntity(
        batchId: batchId,
        batchName: batchName,
      );

  // Convert Entity to Hive Object
  BatchHiveModel toHiveModel(BatchEntity entity) => BatchHiveModel(
        // batchId: entity.batchId,
        batchName: entity.batchName,
      );

  // Convert Hive List to Entity List
  List<BatchEntity> toEntityList(List<BatchHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  String toString() {
    return 'batchId: $batchId, batchName: $batchName';
  }
}
