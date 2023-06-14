import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:student_clean_arch/config/constants/hive_table_constant.dart';
import 'package:student_clean_arch/features/batch/domain/entity/batch_entity.dart';
import 'package:uuid/uuid.dart';

// for generating Adapter for solving Binary Form problem, Note: give name file name
// NOte: part is always after import
part 'batch_hive_model.g.dart';

// run this command in terminal, if there any changes in this file
// dart run build_runner build --delete-conflicting-outputs

final batchHiveModelProvider = Provider((ref) => BatchHiveModel.empty());

@HiveType(typeId: HiveTableConstant.batchTableId)
class BatchHiveModel {
  // giving index 0 for id column
  @HiveField(0)
  final String? batchId;

// giving index 1 for batchName column
  @HiveField(1)
  String? batchName;

  // empty constructor
  BatchHiveModel.empty() : this(batchId: '', batchName: '');

  BatchHiveModel({
    String? batchId,
    required this.batchName,
    // insert batch id that is given from UI otherwise if it is null, then, generate id using Uuid
  }) : batchId = batchId ?? const Uuid().v4();

  // convert Hive Object to Entity ==> passing data from Model to Entity
  BatchEntity toEntity() =>
      BatchEntity(batchId: batchId, batchName: batchName!);

  // convert Entity to Hive Object  ==> passing data from Entity to Model , where batchId is not sent there
  BatchHiveModel toHiveModel(BatchEntity entity) => BatchHiveModel(
        // batchId: entity.batchId,
        batchName: batchName,
      );

  // convert Hive List to Entity List
  List<BatchEntity> toEntityList(List<BatchHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  String toString() {
    return 'batchId: $batchId, batchName: $batchName';
  }
}
