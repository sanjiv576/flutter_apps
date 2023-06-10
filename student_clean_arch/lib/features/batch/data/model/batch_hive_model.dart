import 'package:hive/hive.dart';
import 'package:student_clean_arch/config/constants/hive_table_constant.dart';
import 'package:uuid/uuid.dart';

// for generating Adapter for solving Binary Form problem, Note: give name file name
// NOte: part is always after import
part 'batch_hive_model.g.dart';

// run this command in terminal, if there any changes in this file
// dart run build_runner build --delete-conflicting-outputs

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
}
